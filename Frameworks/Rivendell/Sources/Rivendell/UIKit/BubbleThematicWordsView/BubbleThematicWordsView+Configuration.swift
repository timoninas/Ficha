//
//  BubbleThematicWordsView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation
import UIKit

extension BubbleThematicWordsView {
    
    public struct Configuration {
        
        public private(set) var title: String
        
        public private(set) var badgeText = ""
        
        public private(set) var iconImage: UIImage?
        
        public private(set) var backgroundColor: UIColor = .clear
        
        public private(set) var cornerRadius: CGFloat = 0.0
        
        public init(title: String) {
            self.title = title
        }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(badgeText: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.badgeText = badgeText
            return mutableSelf
        }
        
        public func with(iconImage: UIImage?) -> Configuration {
            var mutableSelf = self
            mutableSelf.iconImage = iconImage
            return mutableSelf
        }
        
        public func with(backgroundColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.backgroundColor = backgroundColor
            return mutableSelf
        }
        
        public func with(cornerRadius: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.cornerRadius = cornerRadius
            return mutableSelf
        }
        
    }
    
}
