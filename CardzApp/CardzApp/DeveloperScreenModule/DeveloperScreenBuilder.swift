//
//  DeveloperScreenBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 13.12.2021.
//

import UIKit
import Hobbiton

final class DeveloperScreenBuilder {
    
    static func build() -> UINavigationController {
        let presenter = DeveloperScreenPresenter()
        let view = DeveloperScreenViewController(output: presenter)
        view.modalPresentationStyle = .overFullScreen
        view.modalTransitionStyle = .crossDissolve
        presenter.view = view
        let navigationVC = NavigationController(rootViewController: view)
        return navigationVC
    }
    
}
