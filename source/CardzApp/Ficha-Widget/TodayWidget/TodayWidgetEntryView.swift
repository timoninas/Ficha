//
//  TodayWidgetEntryView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI

struct TodayWidgetEntryView: View {
    
    var entry: TodayProvider.Entry
    
    @ViewBuilder
    var body: some View {
        FichaSmallView(entry.shot)
    }
    
}

struct TodayWidgetEntryView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetEntryView(entry: .init(date: Date(), shot: .simpleWordShot))
        }
    }
    
}
