//
//  File.swift
//  
//
//  Created by Антон Тимонин on 22.11.2021.
//

import UIKit
import Hobbiton

public extension RVButton {
    
    struct Configuration {
        
        /// Задний цвет кнопки в состоянии покоя. По умолчанию `.mysteryShack`.
        public private(set) var backgroundColor: UIColor = .mysteryShack
        
        /// Задний цветк кнопки в нажатом состоянии. По умолчанию `.mysteryShack`.
        public private(set) var highlitedColor: UIColor = .mysteryShack
        
        /// Главный текст кнопки. По умолчанию `empty`.
        public private(set) var title: String = ""
        
        /// Детальный текст кнопки. По умолчанию `nil`.
        public private(set) var subtitle: String?
        
        /// Замыкание, которое сработает при нажатии на кнопку. По умолчанию `nil`.
        public private(set) var onTap: ((_ button: RVButton) -> Void)?
        
        /// Вариация размеров кнопки.
        public enum Size {
            case legolas
        }
        
        /// Вариация стиля кнопки.
        public enum Style {
            case karmin
        }
        
        /// Размер кнопки. По умолчанию `.legolas`.
        public private(set) var size: Size = .legolas
        
        /// Стиль кнопки. По умолчанию `.karmin`.
        public private(set) var style: Style = .karmin
        
        public var height: CGFloat {
            switch size {
            case .legolas:
                return 60.0
            }
        }
        
        /// Радиус закругления кнопки.
        public var cornerRadius: CGFloat {
            switch style {
            case .karmin:
                return 13.0
            }
        }
        
        public var titleFontSize: CGFloat {
            switch size {
            case .legolas:
                return 16.0
            }
        }
        
        public var subtitleFontSize: CGFloat {
            switch size {
            case .legolas:
                return 12.0
            }
        }
        
        /// Цвет главного текста.
        public var titleColor: UIColor {
            switch style {
            case .karmin:
                return .gendalf
            }
        }
        
        /// Цвет детального текста.
        public var subtitleColor: UIColor {
            switch style {
            case .karmin:
                return .gendalf
            }
        }
        
        /// Инициализирует `Configration` для `RVButton`.
        public init() {}
        
        public func with(backgroundColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.backgroundColor = backgroundColor
            return mutableSelf
        }
        
        public func with(highlitedColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.highlitedColor = highlitedColor
            return mutableSelf
        }
        
        public func with(size: Size) -> Configuration {
            var mutableSelf = self
            mutableSelf.size = size
            return mutableSelf
        }
        
        public func with(style: Style) -> Configuration {
            var mutableSelf = self
            mutableSelf.style = style
            return mutableSelf
        }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(subtitle: String?) -> Configuration {
            var mutableSelf = self
            mutableSelf.subtitle = subtitle
            return mutableSelf
        }
        
        public func with(onTap: ((_ button: RVButton) -> Void)?) -> Configuration {
            var mutableSelf = self
            mutableSelf.onTap = onTap
            return mutableSelf
        }
        
    }
    
}
