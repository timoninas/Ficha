//
//  ThematicWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation
import Rivendell
import Erebor

final class ThematicWordzPresenter: ThematicWordzViewOutput {
    
    weak var view: ThematicWordzViewInput?
    
    private var typeWord: ArkenstoneTypeWord
    
    init(typeWord: ArkenstoneTypeWord) {
        self.typeWord = typeWord
    }
    
    func viewDidLoad() {
        
        mockFetchData()
    }
    
    private func fetchData() {
        
    }
    
    private func mockFetchData() {
        let wordsPreviews: [PreviewViewModel] = [
            .init(title: "To get out", secondTitles: ["Выйти наружу", "Выбраться отсюда"]),
            .init(title: "To find out", secondTitles: ["Выяснить", "Обнаруживать", "Разузнать"]),
            .init(title: "Words Words Words Words", secondTitles: ["Слова", "Какие-то слова"]),
            .init(title: "Words", secondTitles: ["Слово 1", "Слово 2"]),
            .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 2"]),
            .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 1", "Слово 1", "Слово 1"]),
            .init(title: "Words Wordz 1", secondTitles: ["Слово"]),
            .init(title: "Words KEK", secondTitles: ["Слово MEM"]),
            .init(title: "Words LOL", secondTitles: ["Слово"]),
        ]
        view?.changeState(state: .normal(model: .init(title: typeWord.rawValue, wordsPreview: wordsPreviews)))
    }
    
}
