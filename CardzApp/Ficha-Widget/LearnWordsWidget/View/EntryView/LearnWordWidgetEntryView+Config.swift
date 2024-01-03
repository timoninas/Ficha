//
//  LearnWordWidgetEntryView+Config.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation

extension LearnWordWidgetEntryView {
    
    /// Состояние виджета.
    enum State: Hashable {
        /// Слово.
        case word(Word)
        /// Информер.
        case inform(Inform)
    }
    
    /// Тип действия с виджетом.
    enum Action: Hashable {
        /// Свайп влево.
        case leftSwipe(fromLeft: Bool = false)
        /// Свайп вправо.
        case rightSwipe(fromLeft: Bool = true)
        /// Переключение карточки на перевод.
        case flipToTranslation
        /// Переключение карточки на слово.
        case flipToWord
    }
    
    /// Модель слова.
    struct Word: Hashable {
        
        /// Заголовок.
        let title: String
        
        /// Тип действия со словом.
        let action: Action?
        
        init(title: String, action: Action? = nil) {
            self.title = title
            self.action = action
        }
    }
    
    /// Модель информера.
    struct Inform: Hashable {
        
        /// Название изображения.
        let imageName: String
        
        /// Заголовок.
        let title: String?
    }
}
