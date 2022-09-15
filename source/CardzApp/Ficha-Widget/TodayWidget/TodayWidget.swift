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
    
    private var supportedFamilies: [WidgetFamily] {
        var supportedFamilies: [WidgetFamily] = [.systemSmall, .systemMedium]
        if #available(iOSApplicationExtension 16.0, *) {
            supportedFamilies.append(.accessoryRectangular)
        }
        return supportedFamilies
    }
    
    var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: TodayProvider()) { entry in
                TodayWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("Learn new words")
            .description("here they appear every day.")
            .supportedFamilies(supportedFamilies)
    }
    
}
