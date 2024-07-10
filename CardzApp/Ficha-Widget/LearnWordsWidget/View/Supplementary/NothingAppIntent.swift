//
//  NothingAppIntent.swift
//  CardzApp
//
//  Created by Anton Timonin on 17.01.2024.
//

import AppIntents

struct NothingAction: AppIntent {
    
    static var title: LocalizedStringResource = "Kek lol arbidol"
    static var description: IntentDescription? = "Not description"
    static var openAppWhenRun: Bool = false
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
