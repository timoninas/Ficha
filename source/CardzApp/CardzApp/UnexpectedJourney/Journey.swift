//
//  Journey.swift
//  CardzApp
//
//  Created by Антон Тимонин on 30.01.2022.
//

import UIKit
import Erebor
import Rivendell

enum Journey {
    case devDebug
    case developerScreen
    case onboarding(model: OnboardingModuleModel)
    case thematicWordz(typeWord: ArkenstoneTypeWord, typeTranslation: SilverTypeTranslation)
    case favourite
    case alert(model: AlertModel)
    case learnCard(mode: CardLearnModel, viewModel: [LearnWordzCardView.ViewModel])
    case learnNewWordz
    case dailyWords
    case learnTimes
}
