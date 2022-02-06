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
