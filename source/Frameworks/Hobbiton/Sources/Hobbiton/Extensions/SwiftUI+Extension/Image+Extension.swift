//
//  Image+Extension.swift
//  
//
//  Created by Антон Тимонин on 06/02/2022.
//

import SwiftUI

public extension Image {
    
    private static func imageFromBundle(named: String) -> Image {
        Image(named, bundle: .module)
    }
    
    static let fichaLogo = imageFromBundle(named: "ficha-logo")
    
    static let revolvetra = imageFromBundle(named: "Revolvetra")
    
    static let closeIcon = imageFromBundle(named: "closeIcon")
    
}
