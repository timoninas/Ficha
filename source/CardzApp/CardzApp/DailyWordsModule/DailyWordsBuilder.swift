//
//  DailyWordsBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit

final class DailyWordsBuilder {
    
    static func build() -> UIViewController {
        let presenter = DailyWordsPresenter()
        let view = DailyWordsViewController(output: presenter)
        presenter.input = view
        return view
    }
    
}
