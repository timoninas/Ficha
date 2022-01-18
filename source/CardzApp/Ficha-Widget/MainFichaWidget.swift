//
//  Ficha_Widget.swift
//  Ficha-Widget
//
//  Created by Антон Тимонин on 14.01.2022.
//

import WidgetKit
import SwiftUI

/// Сам Widget.
@main
struct Ficha_Widget: Widget {
    let kind: String = "Ficha_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Ficha_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ficha")
        .description("The appearance of new words every day!")
        .supportedFamilies([.systemSmall])
    }
}

struct Ficha_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Ficha_WidgetEntryView(entry: SimpleEntry(date: Date(), shot: .simpleWordShot))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
