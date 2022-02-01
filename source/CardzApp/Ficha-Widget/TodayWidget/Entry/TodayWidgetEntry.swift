//
//  TodayWidgetEntry.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import WidgetKit

/// Слепок с данным для отображения на Widget.
struct TodayWidgetEntry: TimelineEntry {
    
    let date: Date
    
    let shot: TodayWordShot
    
}
