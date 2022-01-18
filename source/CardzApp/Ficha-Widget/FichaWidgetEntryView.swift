//
//  FichaWidgetEntryView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI

/// Как будет выглядеть виджет.
struct Ficha_WidgetEntryView : View {
    var entry: Provider.Entry
    
    /// Gives font family
//    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        FichaSmallView(entry.shot)
    }
}

struct Ficha_WidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Ficha_WidgetEntryView(entry: .init(date: Date(), shot: .simpleWordShot))
        }
    }
}
