//
//  FavouriteWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation
import Erebor
import RevolvetraUserDefaults
import UIKit

final class FavouriteWordzPresenter {
    
    // MARK: - Constants
    
    private struct Constants {
        static let arkenstone: ArkenstoneTypeWord = .favourite
    }
    
    // MARK: - Properties
    
    weak var view: FavouriteWordzViewInput?
    
    private var viewModels: [FavouriteWordzViewController.ViewModel] = []
    
    private var wordResultsStorage: WordResultsStorageProtocol
    private var dbManager: MoriaManagerProtocol
    
    // MARK: - Init
    
    init(wordResultsStorage: WordResultsStorageProtocol,
         dbManager: MoriaManagerProtocol) {
        self.wordResultsStorage = wordResultsStorage
        self.dbManager = dbManager
        self.subscribeToChanges()
    }
    
    // MARK: - Methods
    
    func viewDidAppear() {
        actualizeFavouriteSection()
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
    
    private func actualizeFavouriteSection() {
        guard !wordResultsStorage.words.isEmpty else { return }
        wordResultsStorage.words
            .filter({ $0.actionType == .leftSwipe })
            .forEach { wordResult in
                dbManager.addWordz(model: .init(
                    wordz: wordResult.word.title,
                    examples: [],
                    translations: [wordResult.word.translation],
                    type: .favourite,
                    languageVersion: .enToRu,
                    displayedCount: 1
                ))
            }
        wordResultsStorage.words = []
    }
    
    private func subscribeToChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appMovedToForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    @objc
    private func appMovedToForeground() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.actualizeFavouriteSection()
            self.fetchData()
        }
    }
    
}

// MARK: - FavouriteWordzViewOutput

extension FavouriteWordzPresenter: FavouriteWordzViewOutput {
    
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
