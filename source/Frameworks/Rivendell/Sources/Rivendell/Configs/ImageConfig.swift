//
//  ImageConfig.swift
//  
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit

public enum ImageConfig {
    case visible(image: UIImage?, tintColor: UIColor, aspectRatio: CGFloat)
    case notVisible
    
    func isSame(old: ImageConfig) -> Bool {
        switch (self, old) {
        case (.visible(image: let lhsImage, tintColor: let lhsColor, aspectRatio: let lhsAspectRatio), .visible(image: let rhsImage, tintColor: let rhsColor, aspectRatio: let rhsAspectRatio)):
            return lhsImage == rhsImage && lhsColor == rhsColor && lhsAspectRatio == rhsAspectRatio
        case (.notVisible, .notVisible):
            return true
        default:
            return false
        }
    }
}
