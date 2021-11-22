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
        
        /// Радиус закругления кнопки. По умолчанию `0.0`.
        public private(set) var cornerRadius: CGFloat = 0.0
        
        /// Главный текст кнопки. По умолчанию `""`.
        public private(set) var title: String = ""
        
        /// Цвет главного текста. По умолчанию `.nazgul`.
        public private(set) var titleColor: UIColor = .gendalf
        
        /// Детальный текст кнопки. По умолчанию `nil`.
        public private(set) var subtitle: String?
        
        /// Цвет детального текста. По умолчанию `.nazgul`.
        public private(set) var subtitleColor: UIColor = .gendalf
        
        /// Замыкание, которое сработает при нажатии на кнопку. По умолчанию `nil`.
        public private(set) var onTap: ((_ button: RVButton) -> Void)?
        
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
        
        public func with(cornerRadius: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.cornerRadius = cornerRadius
            return mutableSelf
        }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(titleColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.titleColor = titleColor
            return mutableSelf
        }
        
        public func with(subtitle: String?) -> Configuration {
            var mutableSelf = self
            mutableSelf.subtitle = subtitle
            return mutableSelf
        }
        
        public func with(subtitleColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.subtitleColor = subtitleColor
            return mutableSelf
        }
        
        public func with(onTap: ((_ button: RVButton) -> Void)?) -> Configuration {
            var mutableSelf = self
            mutableSelf.onTap = onTap
            return mutableSelf
        }
        
    }
    
}
