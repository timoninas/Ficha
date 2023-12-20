//
//  LearnNewWordzViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import UIKit

extension LearnNewWordzViewController {
    
    struct ViewModel {
        
        var items: [Item]
        
        struct Item: Equatable {
            let title: String
            let image: UIImage?
            let badgeText: String
        }
    }
    
}
