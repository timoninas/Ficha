//
//  TodayWordShot.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 19.01.2022.
//

import SwiftUI

struct TodayWordShot: Hashable, Codable, Identifiable {
    
    let wordz: String
    let translate: String
    let example: String?
    
    var id: String {
        wordz
    }
    
    static let simpleWordShot = TodayWordShot(
        wordz: "Cinema",
        translate: "Кино",
        example: "You’re right that is a lovely depiction of postmodernism"
    )
    
    static let longWordShot = TodayWordShot(
        wordz: "Cinema cinema cinema cinema cinema cinema",
        translate: "Кино кино кино кино кино кино кино",
        example: "You’re right that is a lovely depiction of postmodernism. You’re right that is a lovely depiction of postmodernism. You’re right that is a lovely depiction of postmodernism"
    )
    
    static let nonExampleWordShot = TodayWordShot(
        wordz: "Cinema cinema cinema cinema cinema cinema",
        translate: "Кино кино кино кино кино кино кино",
        example: nil
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
        if self.wordz.count < 16 {
            if self.translate.count < 24 {
                return true
            } else {
                return false
            }
        } else {
            if self.translate.count >= 24 {
                return false
            } else {
                return true
            }
        }
    }
    
}
