//
//  LearnTimesMvvmBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07/02/2022.
//

import SwiftUI
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

public final class LearnTimesMvvmBuilder {
    
    static func build() -> UIViewController {
        let wordResultsStorage = WordResultsStorage(key: WidgetSharedKey.widgetWords)
        let wordsStorage = WordsStorage(key: WidgetSharedKey.widgetWords,
                                        resultStorage: wordResultsStorage)
        let model = LearnTimesModel(wordsStorage: wordsStorage)
        let viewModel = LearnTimesViewModel(model: model)
        let view = LearnDailyWordsView(learnTimesViewModel: viewModel)
        let hostingView = UIHostingController(rootView: view)
        return hostingView
    }
    
}
