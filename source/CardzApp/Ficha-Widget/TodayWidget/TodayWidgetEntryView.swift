//
//  TodayWidgetEntryView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI

struct TodayWidgetEntryView: View {
    
    var entry: TodayProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        if family == .systemSmall {
            TodayWidgetSmallView(entry.shot)
        } else if family == .systemMedium {
            TodayWidgetMediumView(entry.shot)
        }
    }
    
}

struct TodayWidgetEntryView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetEntryView(entry: .init(date: Date(), shot: .simpleWordShot))
        }
    }
    
}
