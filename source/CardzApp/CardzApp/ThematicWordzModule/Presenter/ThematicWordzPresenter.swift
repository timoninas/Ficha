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
    
    init(typeWord: ArkenstoneTypeWord, typeTranslation: SilverTypeTranslation) {
        self.typeWord = typeWord
        self.typeTranslation = typeTranslation
    }
    
    func viewDidLoad() {
        
        fetchData()
        
    }
    
    private func fetchData() {
        let array = MoriaManager.shared.getWordz(type: typeWord, typeTranslation: typeTranslation)
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
    
}
