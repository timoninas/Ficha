//
//  DaysChecker.swift
//  CardzApp
//
//  Created by Антон Тимонин on 31.12.2021.
//

import Foundation
import RevolvetraKnowledge

public class DaysChechker {
    
    public static var isNewDay: Bool {
        let currentDate = Date.now
        let currentCalendar = Calendar.current
        let currentComponents = currentCalendar.dateComponents([.month, .day], from: currentDate)
        let currentMonth = currentComponents.month
        let currentDay = currentComponents.day
        
        let lastVisitDate = KnowledgeProfile.lastVisitAppDate
        let lastCalendar = Calendar.current
        let lastComponents = lastCalendar.dateComponents([.month, .day], from: lastVisitDate)
        let lastMonth = lastComponents.month
        let lastDay = lastComponents.day
        
        if lastMonth != currentMonth || lastDay != currentDay {
            KnowledgeProfile.lastVisitAppDate = currentDate
            return true
        }
        
        return false
    }
    
    public static var isQuarterOfDay: Bool {
        let currentDate = Date.now
        
        let lastVisitDate = KnowledgeProfile.lastHalfHalfDateVisit
        
        let difference = Calendar.current.dateComponents([.hour], from: lastVisitDate, to: currentDate)
        let diffHours = abs(difference.hour ?? 0)
        
        if diffHours >= 4 {
            KnowledgeProfile.lastHalfHalfDateVisit = currentDate
            return true
        }
        
        return false
    }
    
}
