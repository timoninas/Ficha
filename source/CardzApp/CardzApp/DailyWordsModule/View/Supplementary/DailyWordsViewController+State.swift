//
//  DailyWordsViewController+State.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.10.2021.
//

import Foundation

extension DailyWordsViewController {
    
    enum State {
        case content(ViewModel)
        case error
    }
    
}
