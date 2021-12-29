//
//  OnboardingCardView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

extension OnboardingCardView {
    
    public struct Configuration {
        
        public enum State {
            case normal
            case fliped
        }
        
        public private(set) var title: String = ""
        
        public private(set) var image: UIImage?
        
        public private(set) var state: State = .normal
        
        public private(set) var flippedImage: UIImage?
        
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
        
        public func with(flippedImage: UIImage?) -> Configuration {
            var mutableSelf = self
            mutableSelf.flippedImage = flippedImage
            return mutableSelf
        }
        
        public func with(state: State) -> Configuration {
            var mutableSelf = self
            mutableSelf.state = state
            return mutableSelf
        }
        
    }
    
}
