//
//  WordzLearnCardView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 02.12.2021.
//

import Foundation

extension LearnWordzCardView {
    
    public struct Configuration {
        
        /// Состояние карточки.
        public enum State {
            /// Иностранное слово.
            case wordz
            /// Перевода с иностранного слова.
            case translation
        }
        
        /// Иностранное слово.
        public private(set) var wordz: String
        
        /// Примеры предложений с иностранным словом. По умолчанию `empty`.
        public private(set) var wordzExamples: [String] = []
        
        /// Транскрипция слова. По умолчанию `nil`.
        public private(set) var transcription: String?
        
        /// Перевод с иностранного языка на родной.
        public private(set) var translations: [String]
        
        /// Состояние карточки.
        public private(set) var state: State = .wordz
        
        /// Флаг наличия транскрипции.
        public var isTranscription: Bool {
            guard transcription != nil else {
                return false
            }
            return true
        }
        
        /// Флаг наличия примеров с иностранным словом.
        public var isExamples: Bool {
            !wordzExamples.isEmpty
        }
        
        /// Флаг наличия переводов слова.
        public var isTranslations: Bool {
            !translations.isEmpty
        }
        
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
        /// - Returns: Измененная конфигурация.
        public func with(wordz: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.wordz = wordz
            return mutableSelf
        }
        
        /// Конфигурирует объект транскрипцией.
        ///
        /// - Parameters:
        ///   - transcription: Транскрипция.
        /// - Returns: Измененная конфигурация.
        public func with(transcription: String?) -> Configuration {
            var mutableSelf = self
            mutableSelf.transcription = transcription
            return mutableSelf
        }
        
        /// Конфигурирует объект примера иностранных слов.
        ///
        /// - Parameters:
        ///   - wordzExamples: Примеры иностранных слов.
        /// - Returns: Измененная конфигурация.
        public func with(wordzExamples: [String]) -> Configuration {
            var mutableSelf = self
            
            mutableSelf.wordzExamples = Array(wordzExamples
                                                .filter{ $0.count < 91 }
                                                .prefix(3))
            return mutableSelf
        }
        
        /// Конфигурирует объект переводом.
        ///
        /// - Parameters:
        ///   - translations: Переводы слов.
        /// - Returns: Измененная конфигурация.
        public func with(translations: [String]) -> Configuration {
            var mutableSelf = self
            mutableSelf.translations = Array(translations
                                                .filter{ $0.count < 91 }
                                                .prefix(3))
            return mutableSelf
        }
        /// Конфигурирует объект состоянием.
        /// - Parameter state: Состояние
        /// - Returns: Измененная конфигурация.
        public func with(state: State) -> Configuration {
            var mutableSelf = self
            mutableSelf.state = state
            return mutableSelf
        }
        
    }
    
}
