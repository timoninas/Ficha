//
//  LearnCardBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import UIKit
import Rivendell

final class LearnCardBuilder {
    
    public static func build(mode: CardLearnModel, viewModel: [LearnWordzCardView.ViewModel]) -> UIViewController {
        let presenter = LearnCardPresenter(viewModel: viewModel.shuffled())
        let view = LearnCardViewController(output: presenter, learnMode: mode)
        presenter.view = view
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        return view
    }
    
}
