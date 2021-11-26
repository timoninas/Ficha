//
//  AlertCardBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.11.2021.
//

import Foundation

final class AlertCardBuilder {
    
    static func build(model: AlertModel) -> AlertCardViewController {
        let presenter = AlertCardPresenter(alertModel: model)
        let view = AlertCardViewController(output: presenter)
        presenter.view = view
        return view
    }
    
}
