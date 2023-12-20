//
//  LearnCardPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import Foundation
import RevolvetraKnowledge
import Rivendell

final class LearnCardPresenter: LearnCardOutput {
    
    weak var view: LearnCardViewInput?
    
    var viewModel: [LearnWordzCardView.ViewModel]
    
    init(viewModel: [LearnWordzCardView.ViewModel]) {
        self.viewModel = viewModel
    }
    
    func viewDidLoad() {
        view?.changeState(state: .content(viewModel))
    }
    
    func didSwipeCardTop(with index: Int) {
        guard index >= 0 && index < viewModel.count else { return }
        let word = viewModel[index]
        let transcription: String? = word.transcription == ""
        ? nil
        : word.transcription
        MoriaManager.shared.addWordz(
            wordz: word.wordz,
            transcription: transcription,
            examples: word.wordzExamples,
            translations: word.translations,
            type: .favourite,
            languageVersion: .unknown
        )
        KnowledgeStats.topSwipesLearnCard += 1
        RLogDebug(message: "Top swipes: \(KnowledgeStats.topSwipesLearnCard)", subsystem: String(describing: self))
    }
    
    func didSwipeCardLeft(with index: Int) {
        KnowledgeStats.leftSwipesLearnCard += 1
        RLogDebug(message: "Left swipes: \(KnowledgeStats.leftSwipesLearnCard)", subsystem: String(describing: self))
    }
    
    func didSwipeCardRight(with index: Int) {
        guard index >= 0 && index < viewModel.count else { return }
        let word = viewModel[index]
        KnowledgeStats.rightSwipesLearnCard += 1
        MoriaManager.shared.updateWordz(
            wordz: word.wordz,
            translations: word.translations,
            type: word.type,
            languageVersion: word.languageVersion,
            count: word.displayedCount + 1
        )
        RLogDebug(message: "Right swipe: \(KnowledgeStats.rightSwipesLearnCard)", subsystem: String(describing: self))
    }
    
    func didDragCard(with index: Int) {
        KnowledgeStats.dragsLearnCard += 1
        RLogDebug(message: "Drag card: \(KnowledgeStats.dragsLearnCard)", subsystem: String(describing: self))
    }
    
}
