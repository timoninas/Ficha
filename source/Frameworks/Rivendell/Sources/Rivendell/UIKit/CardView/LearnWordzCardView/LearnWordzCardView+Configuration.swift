//
//  WordzLearnCardView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 02.12.2021.
//

import Foundation

extension LearnWordzCardView {
    
    public struct Configuration {
        
        /// Иностранное слово.
        public private(set) var wordz: String
        
        /// Примеры предложений с иностранным словом. По умолчанию `empty`.
        public private(set) var wordzExamples: [String] = []
        
        /// Транскрипция слова. По умолчанию `nil`.
        public private(set) var transcription: String?
        
        /// Перевод с иностранного языка на родной.
        public private(set) var translations: [String]
        
        /// Инициализирует объект `LearnWordzCardView`.
        ///
        /// - Parameters:
        ///   - wordz: Иностранное слово.
        ///   - translations: Перевод иностранного слова.
        public init(wordz: String, translations: [String]) {
            self.wordz = wordz
            self.translations = translations
        }
        
        /// Конфигурирует объект иностранным словом.
        ///
        /// - Parameters:
        ///   - wordz: Иностранное слово.
        public func with(wordz: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.wordz = wordz
            return mutableSelf
        }
        
        /// Конфигурирует объект транскрипцией.
        ///
        /// - Parameters:
        ///   - transcription: Транскрипция.
        public func with(transcription: String?) -> Configuration {
            var mutableSelf = self
            mutableSelf.transcription = transcription
            return mutableSelf
        }
        
        /// Конфигурирует объект примера иностранных слов.
        ///
        /// - Parameters:
        ///   - wordzExamples: Примеры иностранных слов.
        public func with(wordzExamples: [String]) -> Configuration {
            var mutableSelf = self
            mutableSelf.wordzExamples = wordzExamples
            return mutableSelf
        }
        
        /// Конфигурирует объект переводом.
        ///
        /// - Parameters:
        ///   - translations: Переводы слов.
        public func with(translations: [String]) -> Configuration {
            var mutableSelf = self
            mutableSelf.translations = translations
            return mutableSelf
        }
        
    }
    
}
