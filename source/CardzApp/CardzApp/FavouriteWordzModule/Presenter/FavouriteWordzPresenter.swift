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
        view?.changeState(state: .normal(model: viewModel))
    }
    
}
