//
//  OnboardingModuleModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

struct OnboardingModuleModel {
    
    let onboardingModels: [OnboardingModel]
    
    struct OnboardingModel {
        let image: UIImage?
        
        var flippedImage: UIImage? = nil
        
        let title: String
    }
}
