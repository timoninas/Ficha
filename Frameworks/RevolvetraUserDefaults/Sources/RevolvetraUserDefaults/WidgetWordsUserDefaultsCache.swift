//
//  WidgetWordsUserDefaultsCache.swift
//  
//
//  Created by Антон Тимонин on 06/02/2022.
//

import Foundation
import RevoletraUserDefaultsKeys

public class WidgetWordsUserDefaultsCache {
    
    public static let key = DailyWordsCacheKey.widgetWords
    public static let internalKey = "US_WidgetWordsUserDefaultsCache"
    
    public static func save(_ value: [DailyWordsUserDefaults]) {
        let group = UserDefaults(suiteName: key)
        group?.set(try? PropertyListEncoder().encode(value), forKey: internalKey)
    }
    
    public static func get() -> [DailyWordsUserDefaults] {
        let groupDefaults = UserDefaults(suiteName: key)
        if let data = groupDefaults?.data(forKey: internalKey) {
            guard let words = try? PropertyListDecoder().decode([DailyWordsUserDefaults].self, from: data) else { return [] }
            return words
        } else {
            return []
        }
    }
    
    public static func remove() {
        let groupDefaults = UserDefaults(suiteName: key)
        groupDefaults?.removeObject(forKey: internalKey)
    }
    
}

