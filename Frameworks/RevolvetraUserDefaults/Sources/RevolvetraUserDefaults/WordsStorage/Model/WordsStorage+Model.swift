//
//  WordsStorage+Model.swift
//  
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation

/// Тип взаимодействия с карточкой в хранилище.
public enum ActionType: Codable, Hashable {
    
    /// Левый свайп.
    case leftSwipe
    
    /// Правый свайп.
    case rightSwipe
}


/// Модель хранилища.
public struct Word: Codable, Hashable {
    
    // MARK: - Properties
    
    /// Заголовок.
    public let title: String
    
    /// Перевод.
    public let translation: String
    
    // MARK: - Init
    
    /// Инит.
    public init(title: String,
                translation: String) {
        self.title = title
        self.translation = translation
    }
}
