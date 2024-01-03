//
//  LearnWordWidget.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 25.12.2023.
//

import WidgetKit
import SwiftUI
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

/// Widget для изучения слов.
struct LearnWordWidget: Widget {
    
    let kind: String = "LearnWord"
    
    private var supportedFamilies: [WidgetFamily] {
        let supportedFamilies: [WidgetFamily] = [.systemSmall]
        return supportedFamilies
    }
    
    var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: LearnWordWidgetProvider(storage: WordsStorage(key: WidgetSharedKey.widgetWords))) { entry in
                LearnWordWidgetEntryView(entry: entry)
            }
            .configurationDisplayName("Learn new words")
            .description("here they appear every day.")
            .supportedFamilies(supportedFamilies)
            .contentMarginsDisabled()
    }
    
}
