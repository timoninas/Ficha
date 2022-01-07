//
//  MergerImagerView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit

public extension MergerImagerView {
    
    struct Configuration {
        
        public private(set) var firstImageConfig: ImageConfig = .notVisible
        
        public private(set) var secondImageConfig: ImageConfig = .notVisible
        
        public init() {}
        
        public func with(firstImageConfig: ImageConfig) -> Configuration {
            var mutableSelf = self
            mutableSelf.firstImageConfig = firstImageConfig
            return mutableSelf
        }
        
        public func with(secondImageConfig: ImageConfig) -> Configuration {
            var mutableSelf = self
            mutableSelf.secondImageConfig = secondImageConfig
            return mutableSelf
        }
    }
    
}
