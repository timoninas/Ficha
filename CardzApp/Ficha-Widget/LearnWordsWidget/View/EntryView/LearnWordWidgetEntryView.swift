//
//  LearnWordWidgetEntryView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 25.12.2023.
//

import SwiftUI
import WidgetKit

struct LearnWordWidgetEntryView: View {
    
    var entry: LearnWordWidgetEntry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        if family == .systemSmall {
            LearnWordSmallWidget(state: entry.state,
                                 toLeftAppIntent: LeftSwipeAppIntent(),
                                 toRightAppIntent: RightSwipeAppIntent(),
                                 flipAppIntent: FlipCardAppIntent())
            
        }
    }
    
}
