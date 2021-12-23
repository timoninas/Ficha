//
//  KnowledgeCards.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public protocol KnowledgeCardsProtocol {
    static var minCountCardToLearn: Int { get set }
}

public class KnowledgeCards: KnowledgeCardsProtocol {
    
    @UserDefault(key: CardsKey.minCountCardToLearn, defaultValue: 10)
    public static var minCountCardToLearn
    
}
