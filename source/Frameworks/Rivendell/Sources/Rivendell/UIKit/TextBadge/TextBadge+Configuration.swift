//
//  File.swift
//  
//
//  Created by Антон Тимонин on 20.12.2021.
//

import UIKit

public extension TextBadge {
    
    struct Configuration {
        
        public private(set) var title = ""
        
        public private(set) var cornerRadius: CGFloat = 0.0
        
        public private(set) var backgroundColor: UIColor = .urukhigh
        
        public init(title: String) {
            self.title = title
        }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(cornerRadius: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.cornerRadius = cornerRadius
            return mutableSelf
        }
        
        public func with(backgroundColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.backgroundColor = backgroundColor
            return mutableSelf
        }
        
    }
    
}
