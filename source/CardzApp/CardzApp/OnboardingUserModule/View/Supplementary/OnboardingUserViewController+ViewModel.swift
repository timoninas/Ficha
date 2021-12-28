//
//  OnboardingUserViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

extension OnboardingUserViewController {
    
    struct ViewModel: Equatable {
        
        let cards: [Card]
        
        struct Card: Equatable {
            
            let title: String
            
            let image: UIImage?
        }
        
    }
    
}
