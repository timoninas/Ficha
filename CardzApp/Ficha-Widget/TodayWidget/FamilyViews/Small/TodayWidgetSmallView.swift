//
//  TodayWidgetSmallView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import WidgetKit
import SwiftUI

struct SmallViewWidgetContentView : View {
    
    var wordz: String
    var translate: String
    
    var body: some View {
        VStack {
            Text(wordz)
                .font(.system( size: 28,
                               weight: .heavy,
                               design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundColor(Color.whisper)
            Text(translate)
                .font(.system(size: 16,
                              weight: .medium,
                              design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(Color.whisper)
        }
    }
    
}

struct TodayWidgetSmallView : View {
    
    var state: TodayWidgetState
    
    init(_ state: TodayWidgetState) {
        self.state = state
    }
    
    var body: some View {
        ZStack {
            
            CustomGradientView(typeGradient: .angled,
                               firstColor: .lightPurrple,
                               secondColor: .darkPurrple)
            
            switch state {
            case .simple(let wordz, let translate),
                    .filled(let wordz, let translate, _):
                SmallViewWidgetContentView(wordz: wordz,
                                           translate: translate)
                .padding(EdgeInsets(top: 4.0,
                                    leading: 4.0,
                                    bottom: 4.0,
                                    trailing: 4.0))
            }
            
            FichaImageLogoView(
                size: CGSize(width: 20.0, height: 20.0)
            )
            
        }
        
    }
    
}

struct TodayWidgetSmallView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetSmallView(.simpleWordState)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            TodayWidgetSmallView(.longWordState)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
    
}
