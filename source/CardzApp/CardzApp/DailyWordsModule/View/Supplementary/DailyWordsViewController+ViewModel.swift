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
        
        let subtitles: [String]?
        
    }
    
    // MARK: - Equatable
    
//    func ==(lhs: X, rhs: X) -> Bool {
//        if let l = lhs as? Y, let r = hrs as? Y {
//            return l.something == r.something
//        }
//        return false
//    }
    
}
