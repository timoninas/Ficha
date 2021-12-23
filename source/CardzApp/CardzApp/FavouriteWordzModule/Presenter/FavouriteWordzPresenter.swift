//
//  FavouriteWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation

final class FavouriteWordzPresenter: FavouriteWordzViewOutput {
    
    weak var view: FavouriteWordzViewInput?
    
    init() {
        
    }
    
    func viewDidLoad() {
        mockFetchData()
    }
    
    private func fetchData() {
        
    }
    
    private func mockFetchData() {
        let viewModel: [FavouriteWordzViewController.ViewModel] = [
            .init(
                wordz: "To get out",
                wordzExamples: [],
                transcription: nil,
                translations: ["Выйти наружу", "Выбраться отсюда"]
            ),
            .init(
                wordz: "To find out",
                wordzExamples: [],
                transcription: nil,
                translations: ["Выяснить", "Обнаруживать", "Разузнать"]
            ),
            .init(
                wordz: "Words Words Words Words",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слова", "Какие-то слова"]
            ),
            .init(
                wordz: "Words",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово 1", "Слово 2"]
            ),
            .init(
                wordz: "Words",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово", "Слово 1", "Слово 2"]
            ),
            .init(
                wordz: "Words",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово", "Слово 1", "Слово 1", "Слово 1", "Слово 1"]
            ),
            .init(
                wordz: "Words Wordz 1",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово"]
            ),
            .init(
                wordz: "Words KEK",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово MEM"]
            ),
            .init(
                wordz: "Words LOL",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово"]
            ),
            .init(
                wordz: "Words LOL",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово"]
            ),
            .init(
                wordz: "Words LOL",
                wordzExamples: [],
                transcription: nil,
                translations: ["Слово"]
            ),
        ]
        view?.changeState(state: .normal(model: viewModel))
    }
    
}
