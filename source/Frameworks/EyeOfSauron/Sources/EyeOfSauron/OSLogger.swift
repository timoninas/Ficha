//
//  OSLogger.swift
//  
//
//  Created by Антон Тимонин on 05.11.2021.
//

import Foundation
import os.log

public enum LogType {
    case debug
    case info
    case error
    
    var level: OSLogType {
        switch self {
        case .info:  return .info
        case .error: return .error
        case .debug: return .debug
        }
    }
}

public protocol Loggable {
    
    func log(message: String, logType: LogType, subsystem: String, category: String)
    
}

public final class OSLogger: Loggable {
    
    // MARK: - Private properties
    
    private var loggers: [String: Logger] = [:]
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Public methods
    
    /// Записывает лог в `Console`.
    /// - Parameters:
    ///  - message: Сообщение лога.
    ///  - logType: Тип лога.
    ///  - subsystem: Подсистема логгера.
    ///  - category: Категория логгера.
    public func log(message: String, logType: LogType, subsystem: String, category: String) {
        let key = "k\(subsystem)\(category)"
        if let logger = loggers[key] {
            writeToLogger(logger: logger, message: "\(message)", logLevel: logType.level)
        } else {
            let logger = Logger(subsystem: subsystem, category: category)
            loggers[key] = logger
            writeToLogger(logger: logger, message: "\(message)", logLevel: logType.level)
        }
    }
    
    // MARK: - Private methods
    
    private func writeToLogger(logger: Logger, message: String, logLevel: OSLogType) {
        logger.log(level: logLevel, "\(message)")
    }
}
