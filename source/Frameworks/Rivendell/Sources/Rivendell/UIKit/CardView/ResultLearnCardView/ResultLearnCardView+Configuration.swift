//
//  File.swift
//  
//
//  Created by Антон Тимонин on 13.12.2021.
//

import Foundation

extension ResultLearnCardView {
    
    public struct Configuration {
        
        /// Количество известных слов слов.
        public private(set) var knowCards: Int = 0
        
        /// Количество неизвестных слов
        public private(set) var dontKnowCards: Int = 0
        
        /// Количество израбнных слов.
        public private(set) var favouritesCards: Int = 0
        
        /// Инициализирует конфигурацию для объекта`ResultLearnCardView`.
        public init() {}
        
        /// Конфигурирует объект количеством известных слов.
        ///
        /// - Parameters:
        ///   - knowCards: Известные слова.
        /// - Returns: Измененная конфигурация.
        public func with(knowCards: Int) -> Configuration {
            var mutableSelf = self
            mutableSelf.knowCards = knowCards
            return mutableSelf
        }
        
        /// Конфигурирует объект количеством неизвестных слов.
        ///
        /// - Parameters:
        ///   - dontKnowCards: Неизвестные слова.
        /// - Returns: Измененная конфигурация.
        public func with(dontKnowCards: Int) -> Configuration {
            var mutableSelf = self
            mutableSelf.dontKnowCards = dontKnowCards
            return mutableSelf
        }
        
        /// Конфигурирует объект количеством избранных слов.
        ///
        /// - Parameters:
        ///   - favouritesCards: Изрбранные слова.
        /// - Returns: Измененная конфигурация.
        public func with(favouritesCards: Int) -> Configuration {
            var mutableSelf = self
            mutableSelf.favouritesCards = favouritesCards
            return mutableSelf
        }
        
    }
    
}
