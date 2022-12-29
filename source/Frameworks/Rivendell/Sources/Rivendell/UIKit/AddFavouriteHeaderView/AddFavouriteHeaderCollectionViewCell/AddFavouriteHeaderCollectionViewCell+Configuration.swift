//
//  AddFavouriteHeaderCollectionViewCell+Configuration.swift
//  
//
//  Created by Антон Тимонин on 23/02/2022.
//

import Foundation

public extension AddFavouriteHeaderCollectionViewCell {
    
    struct Configuration {
        
        public private(set) var placeholderText: String
        
        public init(placeholderText: String) {
            self.placeholderText = placeholderText
        }
        
        public func with(placeholderText: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.placeholderText = placeholderText
            return mutableSelf
        }
        
    }
    
}
