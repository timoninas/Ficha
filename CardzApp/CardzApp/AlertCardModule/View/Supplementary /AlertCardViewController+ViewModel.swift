//
//  AlertCardViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation
import Hobbiton

enum SimpleScreenState<T> {
    case error
    case normal(model: T)
}

/// Представление экрана уведомления.
struct AlertModel {
    
    /// Заголовок уведомления.
    let title: String
    
    /// Детальное описание уведомления.
    let secondTitle: String
    
    /// Действия, который будут выполнены по свайпам.
    let actions: [AlertAction]
    
    struct AlertAction {
        
        let title: String
        
        let onSwipeClosure: VoidClosure?
        
    }
    
}

extension AlertCardViewController {
    
    struct AlertViewModel: Equatable {
        
        /// Заголовок уведомления.
        let title: String
        
        /// Детальное описание уведомления.
        let secondTitle: String?
        
    }
    
}
