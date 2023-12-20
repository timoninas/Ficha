//
//  FichaWidgetBundle.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.02.2022.
//

import WidgetKit
import SwiftUI

@main
struct FichaWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        ShortcutWidget()
        TodayWidget()
    }
    
}
