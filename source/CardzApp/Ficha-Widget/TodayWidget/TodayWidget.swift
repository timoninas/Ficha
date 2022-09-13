//
//  TodayWidget.swift
//  Ficha-Widget
//
//  Created by Антон Тимонин on 14.01.2022.
//

import WidgetKit
import SwiftUI

/// Widget с ежедневными словами.
struct TodayWidget: Widget {
    
    let kind: String = "TodayWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TodayProvider()) { entry in
            TodayWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Learn new words")
        .description("here they appear every day.")
        .supportedFamilies([.systemSmall, .systemMedium, .accessoryRectangular])
    }
    
}
