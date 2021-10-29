//
//  LearnCardBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import Foundation
import UIKit


final class LearnCardBuilder {
    
    public static func build() -> UIViewController {
        let presenter = LearnCardPresenter()
        let view = LearnCardViewController(output: presenter)
        presenter.view = view
        return view
    }
    
}
