//
//  GoJourney.swift
//  CardzApp
//
//  Created by Антон Тимонин on 30.01.2022.
//

import UIKit
import Erebor
import Rivendell

func goJourney(_ journey: Journey) -> UIViewController {
    switch journey {
    case .devDebug:
        return DevDebugBuilder.build()
    case .developerScreen:
        return DeveloperScreenBuilder.build()
    case .onboarding(model: let model):
        return OnboardingUserBuilder.build(model: model)
    case .thematicWordz(typeWord: let typeWord, typeTranslation: let translation):
        return ThematicWordzBuilder.build(typeWord: typeWord, typeTranslation: translation)
    case .favourite:
        return FavouriteWordzBuilder.build()
    case .alert(model: let model):
        return AlertCardBuilder.build(model: model)
    case .learnCard(viewModel: let model):
        return LearnCardBuilder.build(viewModel: model)
    case .learnNewWordz:
        return LearnNewWordzBuilder.build()
    case .dailyWords:
        return DailyWordsBuilder.build()
    case .learnTimes:
        return LearnTimesBuilder.build()
    }
}
