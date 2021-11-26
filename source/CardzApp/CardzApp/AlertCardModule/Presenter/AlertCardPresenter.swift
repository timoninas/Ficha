//
//  AlertCardPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.11.2021.
//

import Foundation
import Hobbiton

final class AlertCardPresenter: AlertCardViewOutput {
    
    weak var view: AlertCardViewInput?
    let alertModel: AlertModel
    
    init(alertModel: AlertModel) {
        self.alertModel = alertModel
    }
    
    func viewDidLoad() {
        view?.changeState(state: .normal(model: alertModel))
    }
    
}
