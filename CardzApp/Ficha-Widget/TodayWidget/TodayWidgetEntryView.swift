//
//  TodayWidgetEntryView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import WidgetKit

struct TodayWidgetEntryView: View {
    
    var entry: TodayProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        if family == .systemSmall {
            TodayWidgetSmallView(entry.state)
        } else if family == .systemMedium {
            TodayWidgetMediumView(entry.state)
        } else if family == .accessoryRectangular {
            TodayWidgetAccessoryRectangularView(entry.state)
        }
    }
    
}
