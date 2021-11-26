//
//  RVAlignImageButton+Configuration.swift
//  
//
//  Created by Антон Тимонин on 16.11.2021.
//

import UIKit

public extension RVAlignImageButton {
    
    enum AlignImage {
        case top
        case left
        case right
        case bottom
    }
    
    struct Configuration {
        
        public private(set) var onTap: ((_ button: RVAlignImageButton) -> Void)?
        
        public private(set) var align: AlignImage = .left
        
        public private(set) var titleConfig: TitleConfig = .notSet
        
        public private(set) var imageConfig: ImageConfig = .notSet
        
        public private(set) var imageMultiplier: CGFloat = 1.0
        
        public init () {}
        
        public func with(onTap: ((_ button: RVAlignImageButton) -> Void)?) -> Configuration {
            var mutableSelf = self
            mutableSelf.onTap = onTap
            return mutableSelf
        }
        
        public func with(align: AlignImage) -> Configuration {
            var mutableSelf = self
            mutableSelf.align = align
            return mutableSelf
        }
        
        public func with(titleConfig: TitleConfig) -> Configuration {
            var mutableSelf = self
            mutableSelf.titleConfig = titleConfig
            return mutableSelf
        }
        
        public func with(imageConfig: ImageConfig) -> Configuration {
            var mutableSelf = self
            mutableSelf.imageConfig = imageConfig
            return mutableSelf
        }
        
        public func with(imageMultiplier: CGFloat) -> Configuration {
            let value = imageMultiplier <= 1.0
            ? (imageMultiplier < 0.0 ? 0.0 : imageMultiplier)
            : 1.0
            
            var mutableSelf = self
            mutableSelf.imageMultiplier = value
            return mutableSelf
        }
        
    }
    
    enum TitleConfig {
        case notSet
        case visible(title: String, color: UIColor)
    }
    
    enum ImageConfig {
        case notSet
        case visible(image: UIImage?, color: UIColor)
    }
    
}
