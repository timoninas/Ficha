//
//  ActionReducer.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation
import RevolvetraUserDefaults

final class ActionReducer {
    
    static func action(lastActionType: ActionType?,
                       previousActionType: ActionType?,
                       isFlipped: Bool) -> LearnWordWidgetEntryView.Action? {
        if let lastActionType,
           let previousActionType {
            switch lastActionType {
            case .leftSwipe:
                switch previousActionType {
                case .leftSwipe:
                    return .leftSwipe(fromLeft: false)
                case .rightSwipe:
                    return .leftSwipe(fromLeft: true)
                }
            case .rightSwipe:
                switch previousActionType {
                case .leftSwipe:
                    return .rightSwipe(fromLeft: true)
                case .rightSwipe:
                    return .rightSwipe(fromLeft: false)
                }
            }
        } else if let lastActionType {
            switch lastActionType {
            case .leftSwipe:
                return .leftSwipe(fromLeft: true)
            case .rightSwipe:
                return .rightSwipe(fromLeft: false)
            }
        } else {
            if isFlipped {
                return .flipToTranslation
            } else {
                return .flipToWord
            }
        }
    }
}
