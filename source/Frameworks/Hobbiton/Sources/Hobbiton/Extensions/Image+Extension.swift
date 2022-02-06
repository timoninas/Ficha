//
//  Image+Extension.swift
//  
//
//  Created by Антон Тимонин on 06/02/2022.
//

import SwiftUI

public extension Image {
    
    static let fichaLogo = imageFromBundle(named: "ficha-logo")
                                  
    private static func imageFromBundle(named: String) -> Image {
        Image(named, bundle: .module)
    }
    
}
