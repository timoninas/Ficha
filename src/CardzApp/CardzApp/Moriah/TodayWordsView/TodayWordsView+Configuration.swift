//
//  TodayWordsView+Configuration.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import Foundation

extension TodayWordsView {
    
    struct Configuration {
        
        public private(set) var title: String = ""
        
        public private(set) var subtitles: [String]?
        
        init() { }
        
        func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        func with(subtitles: [String]?) -> Configuration {
            var mutableSelf = self
            mutableSelf.subtitles = subtitles
            return mutableSelf
        }
        
    }
    
}
