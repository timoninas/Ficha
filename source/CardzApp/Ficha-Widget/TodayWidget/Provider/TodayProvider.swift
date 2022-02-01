//
//  TodayProvider.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import WidgetKit
import RevolvetraUserDefaults

/// Таймлайн из слепков для Widget.
struct TodayProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> TodayWidgetEntry {
        TodayWidgetEntry(date: Date(), shot: .simpleWordShot)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodayWidgetEntry) -> ()) {
        let entry = TodayWidgetEntry(date: Date(), shot: .simpleWordShot)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayWidgetEntry>) -> ()) {
        var entries: [TodayWidgetEntry] = []
        
        var words = DailyWordsUserDefaultsCache.getForGroup().map { word in
            TodayWordShot(wordz: word.title, translate: word.translations.first ?? "")
        }
        if words.isEmpty {
            words.append(contentsOf: [
                .init(wordz: "Cinema", translate: "Кино"),
                .init(wordz: "Sink", translate: "Раковина"),
                .init(wordz: "Bookcase", translate: "Книжный шкаф"),
                .init(wordz: "Comedy", translate: "Комедия"),
                .init(wordz: "Case", translate: "Дело"),
                .init(wordz: "Wearisome", translate: "Утомительный"),
                .init(wordz: "Policy", translate: "Политика"),
                .init(wordz: "Polo shirt", translate: "Рубашка"),
                .init(wordz: "Baptisry", translate: "Баптисерий"),
                .init(wordz: "To count", translate: "Считать"),
            ])
        }
        
        let currentDate = Date()
        words
            .enumerated()
            .forEach { idx, word in
                let entryDate = Calendar.current.date(byAdding: .minute, value: 30 * idx, to: currentDate)!
                let entry = TodayWidgetEntry(date: entryDate, shot: word)
                entries.append(entry)
            }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
}
