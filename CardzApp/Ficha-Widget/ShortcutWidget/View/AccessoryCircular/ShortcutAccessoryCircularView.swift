//
//  ShortcutAccessoryCircularView.swift
//  CardzApp
//
//  Created by Anton Timonin on 20.12.2023.
//

import WidgetKit
import Hobbiton
import Rivendell
import SwiftUI

struct ShortcutAccessoryCircularEntryView : View {
    
    var entry: ShortcutWidgetEntry
    
    init(entry: ShortcutWidgetEntry) {
        self.entry = entry
    }
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            Image(entry.model.imageName ?? "")
                .resizable()
                .frame(width: 36.0, height: 36.0)
                .unredacted()
                .accessibilityLabel("Go learn new words")
        }
        .containerBackground(.background, for: .widget)
    }
    
}


#Preview(as: .accessoryCircular) {
    ShortcutWidget()
} timeline: {
    ShortcutWidgetEntry(
        date: Date(),
        model: .init(imageName: "ficha-logo-accentable")
    )
}
