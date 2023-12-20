//
//  PreviewViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation
import Erebor

/// Представление экрана превьюшных слов слов.
struct PreviewViewModel: Equatable {
    
    /// Заголовок уведомления.
    public let wordz: String
    
    public let wordzExamples: [String]
    
    public let transcription: String?
    
    public let translations: [String]
    
    public let type: ArkenstoneTypeWord
    
    public let languageVersion: SilverTypeTranslation
    
    public let displayedCount: Int64
    
    /// Инициализирует вью модель.
    /// - Parameters:
    ///   - title: Слово.
    ///   - translations: Перевод слова.
    public init(
        wordz: String,
        wordzExamples: [String],
        transcription: String?,
        translations: [String],
        type: ArkenstoneTypeWord,
        languageVersion: SilverTypeTranslation,
        displayedCount: Int64
    ) {
        self.wordz = wordz
        self.wordzExamples = wordzExamples
        self.transcription = transcription
        self.translations = translations
        self.type = type
        self.languageVersion = languageVersion
        self.displayedCount = displayedCount
    }
    
}
