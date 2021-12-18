//
//  ThematicWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation
import Rivendell

final class ThematicWordzPresenter: ThematicWordzViewOutput {
    
    weak var view: ThematicWordzViewInput?
    
    private var viewModel: ThematicWordzViewController.ViewModel
    
    init(viewModel: ThematicWordzViewController.ViewModel) {
        self.viewModel = viewModel
    }
    
    func viewDidLoad() {
        view?.changeState(state: .normal(model: viewModel))
    }
    
}
