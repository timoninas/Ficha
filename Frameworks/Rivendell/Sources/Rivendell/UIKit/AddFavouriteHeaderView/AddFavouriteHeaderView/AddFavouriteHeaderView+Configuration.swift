//
//  AddFavouriteHeaderView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 23/02/2022.
//

import UIKit

public extension AddFavouriteHeaderView {
    
    struct Configuration {
        
        public typealias OnTapClosure = (String?, [String]) -> Void
        
        public private(set) var onTap: OnTapClosure?
        
        public init() {}
        
        public func withOnTap(_ onTap: OnTapClosure?) -> Configuration {
            var mutableSelf = self
            mutableSelf.onTap = onTap
            return mutableSelf
        }
        
    }
    
}
