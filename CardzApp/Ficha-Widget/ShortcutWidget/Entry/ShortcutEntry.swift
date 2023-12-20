//
//  ShortcutEntry.swift
//  CardzApp
//
//  Created by Anton Timonin on 20.12.2023.
//

import WidgetKit
import SwiftUI

struct ShortcutWidgetEntry: TimelineEntry {
    
    let date: Date
    
    let model: ShortcutWidgetModel
}

struct ShortcutWidgetModel: Hashable {
    
    let imageName: String?
}

