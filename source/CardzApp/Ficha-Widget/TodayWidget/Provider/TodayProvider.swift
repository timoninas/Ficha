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
            words.append(.init(wordz: "Relaunch app", translate: "", example: nil))
        }
        
        let currentDate = Date()
        words
            .enumerated()
            .forEach { idx, word in
                let entryDate = Calendar.current.date(byAdding: .minute, value: 30 * idx, to: currentDate)!
                let entry = TodayWidgetEntry(date: entryDate, shot: word)
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
    
    private func defaultEntities() -> [TodayWordShot] {
        let entries: [TodayWordShot] = [
            .init(wordz: "To count", translate: "Считать", example: "He decided not to count his steps"),
            .init(wordz: "Stork", translate: "Аист", example: "Aunt Alexandra was standing stiff as a stork"),
            .init(wordz: "Apse", translate: "Апсида", example: "Well, at the time, you know, it... it seemed like the apse"),
            .init(wordz: "T-shirt", translate: "Футболка", example: "I brought a T shirt"),
            .init(wordz: "Amount of data", translate: "That massive amount of data then unspools into your brain, eventually taking over your consciousness", example: "Объем данных"),
            .init(wordz: "Approximately", translate: "Примерно", example: "He spoke not exactly so, perhaps; but in any case, approximately in that manner"),
            .init(wordz: "To browse", translate: "Просматривать", example: "You want to browse among my books, the pawnshop's just around the corner"),
            .init(wordz: "Copier", translate: "Ксерокс", example: "Except I can't seem to find the copier room"),
            .init(wordz: "Dangerous", translate: "Опасный", example: "I had proposed to Amelia that we stow away on one of their deadly projectiles, but this was a dangerous idea"),
            .init(wordz: "Ceiling", translate: "Потолок", example: "All you've got is me trying to climb through a ceiling tile"),
            .init(wordz: "Cameraman", translate: "Оператор", example: "I think she was a little concerned about shoving the cameraman, and all that")
        ]
        return entries.shuffled()
    }
    
}
