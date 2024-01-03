//
//  Keys.swift
//  
//
//  Created by Антон Тимонин on 05.12.2021.
//

import Foundation

public struct CardStatKey {
    
    public static let leftSwipesLearnCard = "Revolvetra.Ficha.LeftSwipesLearnCard"
    
    public static let rightSwipesLearnCard = "Revolvetra.Ficha.RightSwipesLearnCard"
    
    public static let topSwipesLearnCard = "Revolvetra.Ficha.TopSwipesLearnCard"
    
    public static let dragsLearnCard = "Revolvetra.Ficha.DragsLearnCard"
    
}

public struct CardsKey {
    
    public static let minCountCardToLearn = "UD_KnowledgeCards_minCountCardToLearn"
    
    public static let dailyWords = "UD_KnowledgeCards_dailyWords"
    
}

public struct DeviceKey {
    
    public static let previousAppVersion = "UD_KnowledgeDevice_previousAppVersion"
    
    public static let isEnabledHidingAddFavouriteHeader = "UD_KnowledgeDevice_isEnabledHidingAddFavouriteHeader"
    
}

public struct ProfileKey {
    
    public static let isOnborded = "UD_KnowledgeProfile_isOnborded"
    
    public static let lastVisitAppDate = "UD_KnowledgeProfile_lastVisitAppDate"
    
    public static let lastHalfHalfDateVisit = "UD_KnowledgeProfile_lastHalfHalfDateVisit"
    
}

public struct WidgetSharedKey {
    
    public static let widgetWords = "group.Revolvetra.Inc.Ficha"
}

public struct DailyWordsCacheKey {
    
    public static let dailyWords = "UD_DailyWordsUserDefaultsCache_dailyWords"
    
}

public struct InteractiveWidgetStorage {
    
    public static let interactiveWidgetWordsStorage = "UD_interactiveWidgetWordsStorage"
    
    public static let interactiveWidgetWordsResults = "UD_interactiveWidgetWordsResults"
}
