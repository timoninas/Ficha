//
//  FavouriteWordzViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation

extension FavouriteWordzViewController {
    
    /// Представление экрана избранных слов.
    struct FavouriteWordzViewModel: Equatable {
        
        /// Заголовок уведомления.
        let title: String
        
        /// Детальное описание уведомления.
        let secondTitle: String?
        
    }
    
}
