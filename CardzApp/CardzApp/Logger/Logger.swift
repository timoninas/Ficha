//
//  Logger.swift
//  CardzApp
//
//  Created by Антон Тимонин on 05.11.2021.
//

import Foundation
import EyeOfSauron

final class Logger: Loggable {
    
    private init() {}
    
    private var loggers: [Loggable] = []
    
    public static let shared = Logger()
    
    public func log(message: String, logType: LogType, subsystem: String, category: String) {
        loggers.forEach { logger in
            logger.log(message: message, logType: logType, subsystem: subsystem, category: category)
        }
    }
    
    public func add(_ logger: Loggable) {
        loggers.append(logger)
    }
    
}

public func RLogInfo(message: String, subsystem: String, category: String = "") {
    
    Logger.shared.log(
        message: message,
        logType: .info,
        subsystem: subsystem,
        category: category
    )
    
}

public func RLogError(error: Error, subsystem: String = "", category: String = "") {
    
    Logger.shared.log(
        message: "Failed: \(error) \(error.localizedDescription)",
        logType: .error,
        subsystem: subsystem,
        category: category)
    
}

public func RLogDebug(message: String, subsystem: String, category: String = "") {
    
    Logger.shared.log(
        message: message,
        logType: .debug,
        subsystem: subsystem,
        category: category
    )
    
}

