//
//  TodayWidgetEntry.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 18.01.2022.
//

import WidgetKit
import SwiftUI

/// Слепок с данным для отображения на `Widget`.
struct TodayWidgetEntry: TimelineEntry {
    
    let date: Date
    
    let state: TodayWidgetState
}

enum TodayWidgetState {
    
    case simple(wordz: String, translate: String)
    case filled(wordz: String, translate: String, example: String)
    
    static let simpleWordState = TodayWidgetState.filled(wordz: "Cinema",
                                                         translate: "Кино",
                                                         example: "You’re right that is a lovely depiction of postmodernism")
    
    static let longWordState = TodayWidgetState.filled(wordz: "Cinema cinema cinema cinema cinema cinema",
                                                       translate: "Кино кино кино кино кино кино кино",
                                                       example: "You’re right that is a lovely depiction of postmodernism. You’re right that is a lovely depiction of postmodernism. You’re right that is a lovely depiction of postmodernism")
    
    static let nonExampleWordState = TodayWidgetState.simple(wordz: "Cinema cinema cinema cinema cinema cinema",
                                                             translate: "Кино кино кино кино кино кино кино")
}
