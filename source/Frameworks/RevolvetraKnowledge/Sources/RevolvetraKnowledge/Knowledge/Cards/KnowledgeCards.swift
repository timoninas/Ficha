//
//  KnowledgeCards.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public struct DailyWordsUserDefaults: Encodable, Decodable {
    
    public let title: String
    
    public let examples: [String]
    
    public init(title: String, examples: [String]) {
        self.title = title
        self.examples = examples
    }
    
}

public protocol KnowledgeCardsProtocol {
    static var minCountCardToLearn: Int { get set }
    
    static var dailyWords: [DailyWordsUserDefaults] { get set }
}

public class KnowledgeCards: KnowledgeCardsProtocol {
    
    @UserDefault(key: CardsKey.minCountCardToLearn, defaultValue: 10)
    public static var minCountCardToLearn
    
    @UserDefault(key: CardsKey.dailyWords, defaultValue: [DailyWordsUserDefaults]())
    public static var dailyWords
    
}
