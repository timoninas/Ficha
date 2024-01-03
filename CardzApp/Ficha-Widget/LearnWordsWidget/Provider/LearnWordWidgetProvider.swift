//
//  LearnWordWidgetProvider.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 25.12.2023.
//

import SwiftUI
import WidgetKit
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

/// Таймлайн из слепков для `Widget`.
struct LearnWordWidgetProvider: TimelineProvider {
    
    let storage: WordsStorageProtocol
    
    init(storage: WordsStorageProtocol) {
        self.storage = storage
    }
    
    func placeholder(in context: Context) -> LearnWordWidgetEntry {
        LearnWordWidgetEntry(date: Date(),
                             word: .init(title: "Hello there"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (LearnWordWidgetEntry) -> ()) {
        let firstWord = storage.words.first ?? Word(title: "Hello there",
                                                    translation: "Привет")
        let entry = LearnWordWidgetEntry(date: Date(), word: .init(title: firstWord.title))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<LearnWordWidgetEntry>) -> ()) {
        let timeline: Timeline<LearnWordWidgetEntry>
        if let firstWord = storage.words.first {
            let action = ActionReducer.action(lastActionType: storage.lastAction,
                                              previousActionType: storage.previousAction,
                                              isFlipped: storage.isFlipped)
            let word: LearnWordWidgetEntryView.Word = storage.isFlipped
            ? .init(title: firstWord.translation, action: action)
                : .init(title: firstWord.title, action: action)
            timeline = Timeline(entries: [.init(date: Date(), word: word)],
                                    policy: .after(Date().addingTimeInterval(60.0 * 60.0 * 6.0)))
        } else {
            let entry = LearnWordWidgetEntry(date: Date(),
                                             inform: .init(imageName: "searchIcon",
                                                           title: "Restart the app to get more words"))
            timeline = Timeline(entries: [entry],
                                policy: .never)
        }
        
        completion(timeline)
    }
}
