//
//  OnboardingCardView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

extension OnboardingCardView {
    
    public struct Configuration {
        
        public private(set) var title: String = ""
        
        public private(set) var image: UIImage?
        
        public init() {}
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(image: UIImage?) -> Configuration {
            var mutableSelf = self
            mutableSelf.image = image
            return mutableSelf
        }
        
    }
    
}
