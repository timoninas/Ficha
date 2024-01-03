//
//  WordResultsStorage+Model.swift
//  
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation

/// Модель для хранилища с результатами.
public struct WordResult: Codable, Hashable {
    
    // MARK: - Properties
    
    /// Слово.
    public let word: Word
    
    /// Тип взаимодействия со словом.
    public let actionType: ActionType
    
    // MARK: - Init
    
    /// Инит.
    public init(word: Word, actionType: ActionType) {
        self.word = word
        self.actionType = actionType
    }
}
