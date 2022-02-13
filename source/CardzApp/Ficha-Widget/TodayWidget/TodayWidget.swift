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
        .configurationDisplayName("Ficha")
        .description("The appearance of new words every day!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
    
}

struct Ficha_Widget_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetEntryView(entry: TodayWidgetEntry(date: Date(), shot: .simpleWordShot))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
    
}
