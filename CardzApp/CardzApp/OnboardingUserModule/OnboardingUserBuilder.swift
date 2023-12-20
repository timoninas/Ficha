//
//  OnboardingUserBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

final class OnboardingUserBuilder {
    
    static func build(model: OnboardingModuleModel) -> OnboardingUserViewController {
        let presenter = OnboardingUserPresenter(model: model)
        let view = OnboardingUserViewController(output: presenter)
        presenter.view = view
        view.modalPresentationStyle = .overFullScreen
        view.modalTransitionStyle = .crossDissolve
        return view
    }
    
}
