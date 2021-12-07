//
//  LeardWordzCardView+ViewModel.swift
//  
//
//  Created by Антон Тимонин on 07.12.2021.
//

import Foundation

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
        
        
        public init(wordz: String, translations: [String], transcription: String? = nil, wordzExamples: [String] = []) {
            self.wordz = wordz
            self.wordzExamples = wordzExamples
            self.transcription = transcription
            self.translations = translations
        }
    }
    
}
