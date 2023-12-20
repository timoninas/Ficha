//
//  LearnTimesBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import UIKit

final class LearnTimesBuilder {
    
    public static func build() -> UIViewController {
        let presenter = LearnTimesPresenter()
        let view = LearnTimesViewController(output: presenter)
        presenter.view = view
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        return view
    }
    
}
