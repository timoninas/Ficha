//
//  TodayWidgetAccessoryRectangularView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 13.09.2022.
//

import WidgetKit
import Hobbiton
import SwiftUI

struct TodayAccessoryRectangularView : View {
    
    var wordz: String
    var translate: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 4.0) {
            if #available(iOSApplicationExtension 16.0, *) {
                FichaAccentableImageLogo()
                    .frame(width: 20.0, height: 20.0)
                    .widgetAccentable()
            } else {
                EmptyView()
            }
            
            VStack(alignment: .center, spacing: 0.0) {
                Text(wordz)
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(Color.whisper)
                
                Text(translate)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(Color.whisper)
            }
        }
        
    }
    
}

struct TodayWidgetAccessoryRectangularView : View {
    
    var state: TodayWidgetState
    
    init(_ state: TodayWidgetState) {
        self.state = state
    }
    
    var body: some View {
        
        switch state {
        case .simple(let wordz, let translate),
                .filled(let wordz, let translate, _):
            TodayAccessoryRectangularView(wordz: wordz,
                                          translate: translate)
        }
        
    }
    
}

struct TodayWidgetAccessoryRectangularView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            if #available(iOSApplicationExtension 16.0, *) {
                TodayWidgetAccessoryRectangularView(.simpleWordState)
                    .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            }
            
            if #available(iOSApplicationExtension 16.0, *) {
                TodayWidgetAccessoryRectangularView(.longWordState)
                    .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            }
            
            if #available(iOSApplicationExtension 16.0, *) {
                TodayWidgetAccessoryRectangularView(.nonExampleWordState)
                    .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            }
        }
    }
    
}
