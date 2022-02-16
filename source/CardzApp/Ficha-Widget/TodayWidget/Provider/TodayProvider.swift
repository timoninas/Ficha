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
        
        var words = WidgetWordsUserDefaultsCache.get().map { word in
            TodayWordShot(
                wordz: word.title,
                translate: word.translations.first ?? "",
                example: formateExamples(examples: word.examples)
            )
        }
        
        if words.isEmpty {
            words.append(contentsOf: defaultEntities())
        }
        
        let currentDate = Date()
        words
            .enumerated()
            .forEach { idx, word in
                let entryDate = Calendar.current.date(byAdding: .minute, value: 30 * idx, to: currentDate)!
                let entry = TodayWidgetEntry(date: entryDate, shot: word)
                entries.append(entry)
            }
        print(entries)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func formateExamples(examples: [String]) -> String? {
        let sortedExamples = examples.sorted(by: { $0.count < $1.count })
        var resultString = ""
        sortedExamples.forEach { line in
            let probablyNewLine = resultString + "\(resultString.isEmpty ? "" : "\n\n")\(line)"
            if probablyNewLine.count < 100 {
                resultString = probablyNewLine
            }
        }
        if resultString.isEmpty {
            return nil
        } else {
            return resultString
        }
    }
    
    private func defaultEntities() -> [TodayWordShot] {
        [
            .init(wordz: "Cinema", translate: "Кино", example: "I know it's not a luxury movie cinema yet, but we have a full supply of Red Vines"),
            .init(wordz: "Sink", translate: "Раковина", example: "Which heats up the innards, which means a bigger heat sink"),
            .init(wordz: "Bookcase", translate: "Книжный шкаф", example: "Why are all your things to eat in the bookcase?"),
            .init(wordz: "Comedy", translate: "Комедия", example: "Well sometimes in comedy you have to generalize"),
            .init(wordz: "Case", translate: "Дело", example: "The object was to give the opponent a chance to choose the lesser of two evils-in this case, the truth"),
            .init(wordz: "Wearisome", translate: "Утомительный", example: "An hour or two of wearisome waiting followed"),
            .init(wordz: "Policy", translate: "Политика", example: "That doesn't mean we have to abandon good policy"),
            .init(wordz: "Polo shirt", translate: "Рубашка", example: "He only fits into American polo shirts"),
            .init(wordz: "Baptisry", translate: "Баптисерий", example: nil),
            .init(wordz: "To count", translate: "Считать", example: "He decided not to count his steps"),
        ]
    }
    
}
