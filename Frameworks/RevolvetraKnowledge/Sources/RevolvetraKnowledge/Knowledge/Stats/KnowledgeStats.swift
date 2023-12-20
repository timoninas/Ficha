//
//  KnowledgeStats.swift
//  
//
//  Created by Антон Тимонин on 05.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public protocol KnowledgeStatsProtocol {
    
    static var leftSwipesLearnCard: Int { get set }
    
    static var rightSwipesLearnCard: Int { get set }
    
    static var topSwipesLearnCard: Int { get set }
    
    static var dragsLearnCard: Int { get set }
    
}

public class KnowledgeStats: KnowledgeStatsProtocol {
    
    @UserDefault(key: CardStatKey.leftSwipesLearnCard , defaultValue: 0)
    public static var leftSwipesLearnCard
    
    @UserDefault(key: CardStatKey.rightSwipesLearnCard , defaultValue: 0)
    public static var rightSwipesLearnCard
    
    @UserDefault(key: CardStatKey.topSwipesLearnCard , defaultValue: 0)
    public static var topSwipesLearnCard
    
    @UserDefault(key: CardStatKey.dragsLearnCard , defaultValue: 0)
    public static var dragsLearnCard
    
}
