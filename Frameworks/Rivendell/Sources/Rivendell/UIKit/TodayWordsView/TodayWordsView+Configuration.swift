//
//  TodayWordsView+Configuration.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import Foundation

extension TodayWordsView {
    
    public struct Configuration {
        
        public private(set) var title: String = ""
        
        public private(set) var subtitles: [String]?
        
        public init() { }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(subtitles: [String]?) -> Configuration {
            var mutableSelf = self
            mutableSelf.subtitles = subtitles
            return mutableSelf
        }
        
    }
    
}
