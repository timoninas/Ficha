//
//  LearnNewWordzBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation

final class LearnNewWordzBuilder {
    
    public static func build() -> LearnNewWordzViewController {
        let presenter = LearnNewWordzPresenter()
        let view = LearnNewWordzViewController(output: presenter)
        presenter.view = view
        return view
    }
    
}
