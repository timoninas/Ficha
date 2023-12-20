//
//  SettingCellView+Configuration.swift
//  
//
//  Created by Антон Тимонин on 04.01.2022.
//

import Foundation
import Hobbiton

public extension SettingCellView {
    
    enum State {
        case onlyTitle(title: String)
        case switcher(title: String, initialState: Bool, closure: GenericClosure<Bool>?)
        
        func isSameState(old: State) -> Bool {
            
            switch (self, old) {
            case (.onlyTitle(let lhsTitle), .onlyTitle(let rhsTitle)):
                return lhsTitle == rhsTitle
            case (.switcher(title: let lhsTitle, let lhsState, closure: _), .switcher(title: let rhsTitle, let rhsState, closure: _)):
                return lhsTitle == rhsTitle && lhsState == rhsState
            default:
                return false
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
