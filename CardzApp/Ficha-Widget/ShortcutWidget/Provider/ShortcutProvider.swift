//
//  ShortcutProvider.swift
//  CardzApp
//
//  Created by Anton Timonin on 20.12.2023.
//

import SwiftUI
import WidgetKit
import RevolvetraUserDefaults

/// Таймлайн из слепков для `Widget`.
struct ShortcutProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> ShortcutWidgetEntry {
        ShortcutWidgetEntry(date: Date(), model: .init(imageName: "ficha-logo"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ShortcutWidgetEntry) -> ()) {
        let entry = ShortcutWidgetEntry(date: Date(), model: .init(imageName: "ficha-logo"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ShortcutWidgetEntry>) -> ()) {
        let entry = ShortcutWidgetEntry(date: Date(), model: .init(imageName: "ficha-logo"))
        let timeline = Timeline(entries: [entry],
                                policy: .never)
        completion(timeline)
    }
}
