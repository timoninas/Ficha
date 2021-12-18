//
//  ThematicWordzBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import UIKit
import Hobbiton
import Rivendell

final class ThematicWordzBuilder {
    
    static func build(viewModel: ThematicWordzViewController.ViewModel) -> NavigationController {
        let presenter = ThematicWordzPresenter(viewModel: viewModel)
        let view = ThematicWordzViewController(output: presenter)
        presenter.view = view
        let nav = NavigationController(rootViewController: view)
        return nav
    }
    
}
