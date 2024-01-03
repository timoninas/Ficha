//
//  LearnWordWidgetEntry.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 25.12.2023.
//

import WidgetKit
import RevolvetraUserDefaults

struct LearnWordWidgetEntry: TimelineEntry {
    
    let date: Date
    
    let state: LearnWordWidgetEntryView.State
    
    init(date: Date, word: LearnWordWidgetEntryView.Word) {
        self.date = date
        self.state = .word(word)
    }
    
    init(date: Date, inform: LearnWordWidgetEntryView.Inform) {
        self.date = date
        self.state = .inform(inform)
    }
    
}
