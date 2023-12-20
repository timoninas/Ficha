//
//  ThematicWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation
import Rivendell
import Erebor
import RevolvetraKnowledge

final class ThematicWordzPresenter: ThematicWordzViewOutput {
    
    weak var view: ThematicWordzViewInput?
    
    private var typeWord: ArkenstoneTypeWord
    private var typeTranslation: SilverTypeTranslation
    
    private var dbModels: [WordzModelDB] = []
    
    init(typeWord: ArkenstoneTypeWord, typeTranslation: SilverTypeTranslation) {
        self.typeWord = typeWord
        self.typeTranslation = typeTranslation
    }
    
    func viewWillAppear() {
        fetchData()
    }
    
    private func fetchData() {
        let array = MoriaManager.shared.getWordz(type: typeWord, typeTranslation: typeTranslation)
            .sorted(by: { model1, model2 in
                model1.wordz < model2.wordz
            })
        dbModels = array
        let previewViewModel = array.map {
            PreviewViewModel(
                wordz: $0.wordz,
                wordzExamples: $0.examples,
                transcription: $0.transcription,
                translations: $0.translations,
                type: $0.type,
                languageVersion: $0.languageVersion,
                displayedCount: $0.displayedCount
            )
        }
        view?.changeState(state: .normal(model: .init(title: typeWord.rawValue, wordsPreview: previewViewModel) ))
    }
    
    // MARK: - ThematicWordzViewOutput
    
    func addFavourite(at index: Int) {
        guard index > 0 && index < dbModels.count else { return }
        let model = dbModels[index]
        MoriaManager.shared.addWordz(
            wordz: model.wordz,
            transcription: model.transcription,
            examples: model.examples,
            translations: model.translations,
            type: .favourite,
            languageVersion: .unknown
        )
    }
    
    func resetWordsStat() {
        MoriaManager.shared.updateWordz(
            type: typeWord,
            languageVersion: typeTranslation,
            count: 0
        )
        fetchData()
    }
    
}
