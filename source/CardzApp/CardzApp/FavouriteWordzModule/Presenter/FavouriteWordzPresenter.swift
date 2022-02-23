//
//  FavouriteWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation
import Erebor

final class FavouriteWordzPresenter: FavouriteWordzViewOutput {
    
    private struct Constants {
        static let arkenstone: ArkenstoneTypeWord = .favourite
    }
    
    weak var view: FavouriteWordzViewInput?
    
    private var viewModels: [FavouriteWordzViewController.ViewModel] = []
    
    init() {}
    
    func viewDidAppear() {
        fetchData()
        if viewModels.count > 0 {
            MoriaManager.shared.updateWordz(wordz: viewModels[0].wordz, translations: viewModels[0].translations, type: viewModels[0].type, languageVersion: viewModels[0].languageVersion, count: viewModels[0].displayedCount)
        }
    }
    
    private func fetchData() {
        var array = MoriaManager.shared.getWordz(type: Constants.arkenstone).map {
            FavouriteWordzViewController.ViewModel(
                wordz: $0.wordz,
                wordzExamples: $0.examples,
                transcription: $0.transcription,
                translations: $0.translations,
                displayedCount: $0.displayedCount
            )
        }
        array = Array(array.reversed())
        guard viewModels != array else {
            if self.viewModels.isEmpty {
                view?.changeState(state: .error)
            }
            return
        }
        viewModels = array
        view?.changeState(state: .normal(model: viewModels))
    }
    
    // MARK: - FavouriteWordzViewOutput
    
    func deleteAt(index: Int) {
        guard index >= 0 && index < viewModels.count else { return }
        let word = viewModels[index]
        MoriaManager.shared.deleteWordz(
            with: word.wordz,
            translations: word.translations,
            type: word.type
        )
        fetchData()
    }
    
    func resetWordsStat() {
        MoriaManager.shared.updateWordz(
            type: .favourite,
            languageVersion: .unknown,
            count: 0
        )
        fetchData()
    }
    
    func refetchData() {
        fetchData()
    }
    
}
