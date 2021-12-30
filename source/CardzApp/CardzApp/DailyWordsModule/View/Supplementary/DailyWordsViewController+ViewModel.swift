//
//  DailyWordsViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import Foundation

extension DailyWordsViewController {
    
    struct ViewModel: Equatable {
        
        let title: String
        
        let transcription: String?
        
        let subtitles: [String]?
        
        let translations: [String]
        
    }
    
}
