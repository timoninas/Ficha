//
//  File.swift
//  
//
//  Created by Антон Тимонин on 16.11.2021.
//

import Foundation

public extension RVLeftRightImageButton {
    
    public struct Configuration {
        
        public private(set) var onTap: ((_ button: RVLeftRightImageButton) -> Void)?
        
        public init () {}
        
    }
    
}
