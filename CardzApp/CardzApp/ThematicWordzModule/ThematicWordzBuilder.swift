//
//  ThematicWordzBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import UIKit
import Hobbiton
import Erebor
import Rivendell

final class ThematicWordzBuilder {
    
    static func build(typeWord: ArkenstoneTypeWord, typeTranslation: SilverTypeTranslation) -> NavigationController {
        let presenter = ThematicWordzPresenter(
            typeWord: typeWord,
            typeTranslation: typeTranslation
        )
        let view = ThematicWordzViewController(output: presenter)
        presenter.view = view
        let nav = NavigationController(rootViewController: view)
        return nav
    }
    
}
