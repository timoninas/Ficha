//
//  DailyWordsViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import Foundation
import Erebor

extension DailyWordsViewController {
    
    struct ViewModel: Equatable {
        
        let todayWords: [TodayWords]
        
        struct TodayWords: Equatable {
            
            let title: String
            
            let transcription: String?
            
            let subtitles: [String]?
            
            let translations: [String]
            
            let type: ArkenstoneTypeWord
            
            let languageVersion: SilverTypeTranslation
            
            let displayedCount: Int64
            
        }
        
    }
    
}
