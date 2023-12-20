//
//  ShortcutWidget.swift
//  CardzApp
//
//  Created by Anton Timonin on 20.12.2023.
//

import WidgetKit
import SwiftUI

/// Widget шорткат.
struct ShortcutWidget: Widget {
    
    let kind: String = "ShortcutWidget"
    
    private var supportedFamilies: [WidgetFamily] {
        let supportedFamilies: [WidgetFamily] = [.accessoryCircular]
        return supportedFamilies
    }
    
    var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: ShortcutProvider()) { entry in
                ShortcutAccessoryCircularEntryView(entry: entry)
            }
            .configurationDisplayName("Let's learn new wordz")
            .description("right now, go to the app")
            .supportedFamilies(supportedFamilies)
            .contentMarginsDisabled()
    }
    
}
