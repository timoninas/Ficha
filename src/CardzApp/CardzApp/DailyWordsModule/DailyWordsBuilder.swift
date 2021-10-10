//
//  DailyWordsBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit

final class DailyWordsBuilder {
    
    static func build() -> UIViewController {
        let view = DailyWordsViewController()
        let presenter = DailyWordsPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}
