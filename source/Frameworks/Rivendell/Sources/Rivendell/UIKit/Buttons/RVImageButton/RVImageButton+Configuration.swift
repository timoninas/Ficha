//
//  RVImageButton+Configuration.swift
//  
//
//  Created by Антон Тимонин on 08.11.2021.
//

import UIKit

public extension RVImageButton {
    
    struct Configuration {
        
        public private(set) var backgroundColor: UIColor = .cloud
        
        public private(set) var highlitedColor: UIColor = .gendalf
        
        public private(set) var cornerRadius: CGFloat = 0.0
        
        public private(set) var onTap: ((_ button: RVImageButton) -> Void)?
        
        public private(set) var image: UIImage?
        
        public private(set) var imageColor: UIColor?
        
        public private(set) var imageAspectRatio: CGFloat = 1.0
        
        public private(set) var fullyRounded = false
        
        public init() {}
        
        public func with(backgroundColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.backgroundColor = backgroundColor
            return mutableSelf
        }
        
        public func with(highlitedColor: UIColor) -> Configuration {
            var mutableSelf = self
            mutableSelf.highlitedColor = highlitedColor
            return mutableSelf
        }
        
        public func with(cornerRadius: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.cornerRadius = cornerRadius
            return mutableSelf
        }
        
        public func with(image: UIImage?) -> Configuration {
            var mutableSelf = self
            mutableSelf.image = image
            return mutableSelf
        }
        
        public func with(onTap: ((_ button: RVImageButton) -> Void)?) -> Configuration {
            var mutableSelf = self
            mutableSelf.onTap = onTap
            return mutableSelf
        }
        
        public func with(imageColor: UIColor?) -> Configuration {
            var mutableSelf = self
            mutableSelf.imageColor = imageColor
            return mutableSelf
        }
        
        public func with(imageAspectRation: CGFloat) -> Configuration {
            var mutableSelf = self
            mutableSelf.imageAspectRatio = imageAspectRation
            return mutableSelf
        }
        
        public func with(isFullyRounded: Bool) -> Configuration {
            var mutableSelf = self
            mutableSelf.fullyRounded = isFullyRounded
            return mutableSelf
        }
        
    }
    
}
