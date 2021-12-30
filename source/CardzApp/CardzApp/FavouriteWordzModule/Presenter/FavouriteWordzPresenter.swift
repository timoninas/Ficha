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
    
    init() {
        
    }
    
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        fetchData()
    }
    
    private func fetchData() {
        let array = MoriaManager.shared.getWordz(type: Constants.arkenstone).map {
            FavouriteWordzViewController.ViewModel(
                wordz: $0.wordz,
                wordzExamples: $0.examples,
                transcription: $0.transcription,
                translations: $0.translations
            )
        }
        guard viewModels != array else { return }
        viewModels = array
        view?.changeState(state: .normal(model: viewModels))
    }
    
}
