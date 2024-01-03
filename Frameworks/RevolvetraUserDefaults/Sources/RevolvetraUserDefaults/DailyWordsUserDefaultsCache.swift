//
//  DailyWordsUserDefaultsCache.swift
//  
//
//  Created by Антон Тимонин on 28.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public struct DailyWordsUserDefaults: Codable {
    
    public let title: String
    
    public let transcription: String?
    
    public let examples: [String]
    
    public let translations: [String]
    
    public let type: String
    
    public let languageVersion: String
    
    public let displayedCount: Int64
    
    public init(
        title: String,
        transcription: String?,
        examples: [String],
        translations: [String],
        type: String,
        languageVersion: String,
        displayedCount: Int64
    ) {
        self.title = title
        self.transcription = transcription
        self.examples = examples
        self.translations = translations
        self.type = type
        self.languageVersion = languageVersion
        self.displayedCount = displayedCount
    }
    
}

public class DailyWordsUserDefaultsCache {
    
    public static let key = DailyWordsCacheKey.dailyWords
    
    public static func save(_ value: [DailyWordsUserDefaults]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
    public static func get() -> [DailyWordsUserDefaults] {
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            guard let words = try? PropertyListDecoder().decode([DailyWordsUserDefaults].self, from: data) else { return [] }
            return words
        } else {
            return []
        }
    }
    
    public static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
