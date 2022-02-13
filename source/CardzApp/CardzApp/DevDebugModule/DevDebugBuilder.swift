//
//  DevDebugBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit
import Hobbiton

final class DevDebugBuilder {
    
    static func build() -> UIViewController {
        let module = DevDebugViewController()
        let navigation = NavigationController(rootViewController: module)
        return navigation
    }
    
}
