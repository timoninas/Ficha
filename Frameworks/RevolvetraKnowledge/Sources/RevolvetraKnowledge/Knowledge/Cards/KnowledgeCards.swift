//
//  KnowledgeCards.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys
import RevolvetraUserDefaults

public protocol KnowledgeCardsProtocol {
    
    static var minCountCardToLearn: Int { get set }
    
    static var dailyWords: [DailyWordsUserDefaults] { get set }
}

public class KnowledgeCards: KnowledgeCardsProtocol {
    
    @UserDefault(key: CardsKey.minCountCardToLearn, defaultValue: 5)
    public static var minCountCardToLearn
    
    @UserDefault(key: CardsKey.dailyWords, defaultValue: [DailyWordsUserDefaults]())
    public static var dailyWords
    
}
