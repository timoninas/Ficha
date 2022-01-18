//
//  FichaWordShot.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 19.01.2022.
//

import Foundation

struct WordShot: Hashable, Codable, Identifiable {
    
    let wordz: String
    let translate: String
    
    var id: String {
        wordz
    }
    
    static let simpleWordShot = WordShot(
        wordz: "Cinema",
        translate: "Кино"
    )
    
}
