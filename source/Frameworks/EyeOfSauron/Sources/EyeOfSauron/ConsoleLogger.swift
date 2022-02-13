//
//  ConsoleLogger.swift
//  
//
//  Created by Антон Тимонин on 01.02.2022.
//

import Foundation

public final class ConsoleLogger: Loggable {
    
    public init() {}
    
    public func log(message: String, logType: LogType, subsystem: String, category: String) {
        switch logType {
        case .debug:
            #if DEBUG
            print("[\(logType.describe)][\(subsystem)][\(category)] \(message)")
            #endif
        case .info, .error:
            print("[\(logType.describe)][\(subsystem)][\(category)] \(message)")
        }
    }
    
}
