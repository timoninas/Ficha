//
//  LearnWordAppIntents.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 03.01.2024.
//

import WidgetKit
import SwiftUI
import AppIntents
import Hobbiton
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

struct LeftSwipeAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Swipe card to the left side"
    
    func perform() async throws -> some IntentResult {
        let resultsStorage = WordResultsStorage(key: WidgetSharedKey.widgetWords)
        let storage: WordsStorageProtocol = WordsStorage(
            key: WidgetSharedKey.widgetWords,
            resultStorage: resultsStorage
        )
        storage.swipeCard(.leftSwipe)
        return .result()
    }
}

struct RightSwipeAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Swipe card to the right side"
    
    func perform() async throws -> some IntentResult {
        let resultsStorage = WordResultsStorage(key: WidgetSharedKey.widgetWords)
        let storage: WordsStorageProtocol = WordsStorage(
            key: WidgetSharedKey.widgetWords,
            resultStorage: resultsStorage
        )
        storage.swipeCard(.rightSwipe)
        return .result()
    }
}

struct FlipCardAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Flip current card"
    
    func perform() async throws -> some IntentResult {
        let storage: WordsStorageProtocol = WordsStorage(key: WidgetSharedKey.widgetWords)
        storage.flip()
        return .result()
    }
}
