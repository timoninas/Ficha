//
//  AlertCardBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.11.2021.
//

import Foundation

final class AlertCardBuilder {
    
    static func build(data: AlertCardViewController.AlertViewModel) -> AlertCardViewController {
        let presenter = AlertCardPresenter()
        let view = AlertCardViewController(output: presenter, viewModel: data)
        presenter.view = view
        return view
    }
    
}
