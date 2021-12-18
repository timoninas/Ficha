//
//  PreviewViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation

/// Представление экрана превьюшных слов слов.
struct PreviewViewModel: Equatable {
    
    /// Заголовок уведомления.
    public let title: String
    
    /// Детальное описание уведомления.
    public let secondTitles: [String]
    
    
    /// Инициализирует вью модель.
    /// - Parameters:
    ///   - title: Слово.
    ///   - secondTitles: Перевод слова.
    public init(title: String, secondTitles: [String]) {
        self.title = title
        self.secondTitles = secondTitles
    }
    
}
