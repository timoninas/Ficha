//
//  BlurView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 06/02/2022.
//

import UIKit

public extension BlurView {
    
    struct Configuration {
        
        /// Blur color.
        public private(set) var color: UIColor = .clear
        
        public init() {}
        
        public func with(color: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.color = color
            return mutableSelf
        }
        
    }
    
}
