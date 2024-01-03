//
//  FavouriteWordzBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import UIKit
import Hobbiton
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

final class FavouriteWordzBuilder {
    
    static func build() -> UINavigationController {
        let dbManager = MoriaManager.shared
        let wordResultsStorage = WordResultsStorage(key: WidgetSharedKey.widgetWords)
        let presenter = FavouriteWordzPresenter(wordResultsStorage: wordResultsStorage, dbManager: dbManager)
        let view = FavouriteWordzViewController(output: presenter)
        presenter.view = view
        let nav = NavigationController(rootViewController: view)
        return nav
    }
    
}
