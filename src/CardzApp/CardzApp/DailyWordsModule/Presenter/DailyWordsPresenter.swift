//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation

final class DailyWordsPresenter: DailyWordsOutput {
    
    let view: DailyWordsViewInput
    
    init(view: DailyWordsViewInput) {
        self.view = view
    }
    
}
