//
//  HorizontalOneItemLayout+Configuration.swift
//  
//
//  Created by Антон Тимонин on 26/02/2022.
//

import UIKit

public extension HorizontalLineLayout {
    
    struct Configuration {
        
        public private(set) var topInset: CGFloat = 0.0
        public private(set) var bottomInset: CGFloat = 0.0
        public private(set) var initialSpacing: CGFloat = 0.0
        public private(set) var spacingBetweenCell: CGFloat = 0.0
        public private(set) var heightForOneItem: CGFloat = 0.0
        public private(set) var widthForOneItem: CGFloat = 0.0
        
        public init() {}
        
        public func with(topInset: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.topInset = topInset
            return mutableSelf
        }
        
        public func with(bottomInset: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.bottomInset = bottomInset
            return mutableSelf
        }
        
        public func with(initialSpacing: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.initialSpacing = initialSpacing
            return mutableSelf
        }
        
        public func with(spacingBetweenCell: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.spacingBetweenCell = spacingBetweenCell
            return mutableSelf
        }
        
        public func with(heightForOneItem: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.heightForOneItem = heightForOneItem
            return mutableSelf
        }
        
        public func with(widthForOneItem: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.widthForOneItem = widthForOneItem
            return mutableSelf
        }
        
    }
    
}
