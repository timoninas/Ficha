//
//  FichaWidgetBundle.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.02.2022.
//

import WidgetKit
import SwiftUI
import AppIntents

@main
struct FichaWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        LearnWordWidget()
        ShortcutWidget()
        TodayWidget()
        if #available(iOSApplicationExtension 18.0, *) {
            ShortcutButtonControlWidget()
        }
    }
    
}
