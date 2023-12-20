//
//  WordsPreviewView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 12.12.2021.
//

import Foundation

extension WordsPreviewView {
    
    public struct Configuration {
        
        public private(set) var title: String = ""
        
        public private(set) var translations: [String] = []
        
        public private(set) var isDone = false
        
        public init(title: String) {
            self.title = title
        }
        
        public func with(title: String) -> Configuration {
            var mutableSelf = self
            mutableSelf.title = title
            return mutableSelf
        }
        
        public func with(isDone: Bool) -> Configuration {
            var mutableSelf = self
            mutableSelf.isDone = isDone
            return mutableSelf
        }
        
        public func with(translations: [String]) -> Configuration {
            var mutableSelf = self
            mutableSelf.translations = Array(translations
                                                .filter{ $0.count < 101 }
                                                .prefix(3))
            
            return mutableSelf
        }
        
    }
    
}
