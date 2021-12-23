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
    public let wordz: String
    
    public let wordzExamples: [String]
    
    public let transcription: String?
    
    public let translations: [String]
    
    /// Инициализирует вью модель.
    /// - Parameters:
    ///   - title: Слово.
    ///   - translations: Перевод слова.
    public init(wordz: String,
                wordzExamples: [String],
                transcription: String?,
                translations: [String]) {
        self.wordz = wordz
        self.wordzExamples = wordzExamples
        self.transcription = transcription
        self.translations = translations
    }
    
}
