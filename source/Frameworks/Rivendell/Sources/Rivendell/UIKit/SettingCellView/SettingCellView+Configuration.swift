//
//  SettingCellView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 04.01.2022.
//

import Foundation

public extension SettingCellView {
    
    enum State {
        case onlyTitle(title: String)
        
        func isSameState(old: State) -> Bool {
            
            switch (self, old) {
            case (.onlyTitle(let lhsTitle), .onlyTitle(let rhsTitle)):
                return lhsTitle == rhsTitle
            }
            
        }
    }
    
    struct Configuration {
        
        public private(set) var state: State
        
        public init(state: State) {
            self.state = state
        }
        
        public func with(state: State) -> Configuration {
            var mutableSelf = self
            mutableSelf.state = state
            return mutableSelf
        }
        
    }
    
}
