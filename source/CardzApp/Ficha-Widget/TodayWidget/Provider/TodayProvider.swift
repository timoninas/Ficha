//
//  TodayProvider.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import WidgetKit
import RevolvetraUserDefaults

/// Таймлайн из слепков для `Widget`.
struct TodayProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> TodayWidgetEntry {
        TodayWidgetEntry(date: Date(), state: .filled(wordz: "Hello there",
                                                      translate: "Привет",
                                                      example: "Hello there, Harry! he said. Just had an exam, I expect? Nearly finished?"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodayWidgetEntry) -> ()) {
        let entry = TodayWidgetEntry(date: Date(), state: .filled(wordz: "Hello there",
                                                                  translate: "Привет",
                                                                  example: "Hello there, Harry! he said. Just had an exam, I expect? Nearly finished?"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayWidgetEntry>) -> ()) {
        var entries: [TodayWidgetEntry] = []
        
        var words: [TodayWidgetState]  = WidgetWordsUserDefaultsCache.get().map { word in
            if let example = formateExamples(examples: word.examples) {
                return .filled(wordz: word.title, translate: word.translations.first ?? "", example: example)
            } else {
                return .simple(wordz: word.title, translate: word.translations.first ?? "")
            }
        }
        
        if words.isEmpty {
            words.append(.simple(wordz: "Launch Ficha", translate: "please!"))
        }
        
        let currentDate = Date()
        words
            .enumerated()
            .forEach { idx, word in
                let entryDate = Calendar.current.date(byAdding: .minute, value: 45 * idx, to: currentDate)!
                let entry = TodayWidgetEntry(date: entryDate, state: word)
                entries.append(entry)
            }
        let timeline = Timeline(entries: entries,
                                policy: .atEnd)
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
    
}
