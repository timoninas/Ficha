//
//  ShortcutButtonControlWidget.swift
//  CardzApp
//
//  Created by Anton Timonin on 09.07.2024.
//

import WidgetKit
import SwiftUI
import AppIntents

@available(iOSApplicationExtension 18.0, *)
struct OpenAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Button Control Widget"
    
    static var isDiscoverable: Bool = false
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & OpensIntent {
        let defaultIntent = OpenURLIntent()
        guard let url = URL(string: "fichaApp://") else { return .result(opensIntent: defaultIntent) }
        return .result(opensIntent: OpenURLIntent(url))
    }
}

@available(iOSApplicationExtension 18.0, *)
struct ShortcutButtonControlWidget: ControlWidget {
    
    let kind: String = "widget.ShortcutControlButtonWidget"
    
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: kind) {
            ControlWidgetButton(action: OpenAppIntent()) {
                Label("Ficha", image: "ficha-logo-control")
            }
        }
    }
}
