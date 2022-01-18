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
    
    var titleLineCount: Int {
        let titleCount = self.wordz.count < 17 ? 2 : 3
        return titleCount
    }
    
    var subtitleLineCount: Int {
        let subtitleCount = self.wordz.count < 17 ? 2 : 1
        return subtitleCount
    }
    
    var canShowLogo: Bool {
        if self.wordz.count < 17 {
            if self.translate.count < 25 {
                return true
            } else {
                return false
            }
        } else {
            if self.translate.count >= 25 {
                return false
            } else {
                return true
            }
        }
    }
    
}
