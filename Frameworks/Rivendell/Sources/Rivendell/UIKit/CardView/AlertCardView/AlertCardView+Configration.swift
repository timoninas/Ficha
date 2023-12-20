//
//  AlertCardView+Configration.swift
//  
//
//  Created by Антон Тимонин on 14.11.2021.
//

import Foundation

extension AlertCardView {
    
    public struct Configuration {
        
        public private(set) var title: String = ""
        
        public private(set) var secondTitle: String?
        
        public init() {}
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(secondTitle: String?) -> Configuration {
            var mutableSelf = self
            mutableSelf.secondTitle = secondTitle
            return mutableSelf
        }
        
    }
    
}
