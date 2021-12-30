//
//  LeardWordzCardView+ViewModel.swift
//  
//
//  Created by Антон Тимонин on 07.12.2021.
//

import Foundation
import Erebor

public extension LearnWordzCardView {
    
    struct ViewModel {
        
        /// Иностранное слово.
        public var wordz: String
        
        /// Перевод с иностранного языка на родной.
        public var translations: [String]
        
        /// Транскрипция слова. По умолчанию `nil`.
        public var transcription: String?
        
        /// Примеры предложений с иностранным словом. По умолчанию `empty`.
        public var wordzExamples: [String] = []
        
        public var type: ArkenstoneTypeWord
        
        public var languageVersion: SilverTypeTranslation
        
        /// Инициализирует `ViewModel` для `LearnWordzCardView`.
        /// - Parameters:
        ///   - wordz: Иностранное слово.
        ///   - translations: Переводы иностранного слова.
        ///   - transcription: Транскрипция иностранного слова. По умолчанию `nil`.
        ///   - wordzExamples: Примеры перевода иностранного слова. По умолчанию `[]`.
        public init(
            wordz: String,
            translations: [String],
            transcription: String? = nil,
            wordzExamples: [String] = [],
            type: ArkenstoneTypeWord,
            languageVersion: SilverTypeTranslation
        ) {
            self.wordz = wordz
            self.wordzExamples = wordzExamples
            self.transcription = transcription
            self.translations = translations
            self.type = type
            self.languageVersion = languageVersion
        }
    }
    
}
