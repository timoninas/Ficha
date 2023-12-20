//
//  FavouriteWordzViewController+ViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation
import Erebor

extension FavouriteWordzViewController {
    
    /// Представление экрана избранных слов.
    struct ViewModel: Equatable {
        
        /// Заголовок уведомления.
        let wordz: String
        
        let wordzExamples: [String]
        
        let transcription: String?
        
        /// Детальное описание уведомления.
        let translations: [String]
        
        let type: ArkenstoneTypeWord = .favourite
        
        let languageVersion: SilverTypeTranslation = .unknown
        
        let displayedCount: Int64
        
    }
    
}
