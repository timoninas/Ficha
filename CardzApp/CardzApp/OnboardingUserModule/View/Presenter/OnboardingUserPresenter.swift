//
//  OnboardingUserPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import Foundation

final class OnboardingUserPresenter: OnboardingUserViewOutput {
    
    weak var view: OnboardingUserViewInput?
    
    private var model: OnboardingModuleModel
    
    private var onboardingModelToViewModel: (OnboardingModuleModel) -> OnboardingUserViewController.ViewModel = {
        .init(cards: $0.onboardingModels.map { OnboardingUserViewController.ViewModel.Card.init(title: $0.title, image: $0.image, flippedImage: $0.flippedImage)
        })
    }
    
    init(model: OnboardingModuleModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        view?.changeState(state: .normal(model: onboardingModelToViewModel(model)))
    }
    
}
