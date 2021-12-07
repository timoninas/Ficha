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
        KnowledgeStats.topSwipesLearnCard += 1
        print("Top swipes: \(KnowledgeStats.topSwipesLearnCard)")
    }
    
    func didSwipeCardLeft(with index: Int) {
        KnowledgeStats.leftSwipesLearnCard += 1
        print("Left swipes: \(KnowledgeStats.leftSwipesLearnCard)")
    }
    
    func didSwipeCardRight(with index: Int) {
        KnowledgeStats.rightSwipesLearnCard += 1
        print("Right swipe: \(KnowledgeStats.rightSwipesLearnCard)")
    }
    
}
