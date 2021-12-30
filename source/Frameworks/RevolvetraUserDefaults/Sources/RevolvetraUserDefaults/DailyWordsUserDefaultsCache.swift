//
//  DailyWordsUserDefaultsCache.swift
//  
//
//  Created by Антон Тимонин on 28.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public struct DailyWordsUserDefaults: Encodable, Decodable {
    
    public let title: String
    
    public let transcription: String?
    
    public let examples: [String]
    
    public let translations: [String]
    
    public init(title: String, transcription: String?, examples: [String], translations: [String]) {
        self.title = title
        self.transcription = transcription
        self.examples = examples
        self.translations = translations
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

