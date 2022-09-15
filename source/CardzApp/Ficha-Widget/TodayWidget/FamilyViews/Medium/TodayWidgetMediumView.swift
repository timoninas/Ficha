//
//  FichaMediumView.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 02.02.2022.
//

import WidgetKit
import SwiftUI

struct MediumWidgetSimpleView : View {
    
    var wordz: String
    var translate: String
    
    var body: some View {
        
        ZStack {
            CustomGradientView(typeGradient: .angled,
                               firstColor: .lightPurrple,
                               secondColor: .darkPurrple)
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 0.0, content: {
                    VStack(alignment: .center, spacing: 0.0) {
                        WordzAndTranslateView(wordz: wordz,
                                              translate: translate)
                    }
                    .frame(width: geometry.size.width,
                           height: geometry.size.height,
                           alignment: .center)
                })
            }
            .padding(EdgeInsets(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0))
            
            FichaImageLogoView(
                size: CGSize(width: 23.0, height: 23.0)
            )
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct MediumWidgetFilledView : View {
    
    var wordz: String
    var translate: String
    var example: String
    
    var body: some View {
        ZStack {
            
            CustomGradientView(typeGradient: .simple,
                               firstColor: .darkPurrple,
                               secondColor: .lightPurrple)
            
            HStack(spacing: 8.0) {
                Color.darkPurrple
                    .cornerRadius(30.0, corners: [.bottomRight])
                Color.lightPurrple
                    .cornerRadius(30.0, corners: [.topLeft])
            }
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 0.0, content: {
                    VStack(alignment: .center, spacing: 0.0) {
                        WordzAndTranslateView(wordz: wordz,
                                              translate: translate)
                    }
                    .frame(width: geometry.size.width / 2.0 - 6.0,
                           height: geometry.size.height, alignment: .center)
                    HStack(spacing: 0.0) {
                        Spacer()
                        ExamplesWordsView(example: example)
                            .frame(width: geometry.size.width / 2.0 - 10.0,
                                   height: geometry.size.height, alignment: .center)
                    }
                })
            }
            .padding(EdgeInsets(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0))
            
            FichaImageLogoView(
                size: CGSize(width: 23.0, height: 23.0)
            )
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct TodayWidgetMediumView : View {
    
    var state: TodayWidgetState
    
    init(_ state: TodayWidgetState) {
        self.state = state
    }
    
    var body: some View {
        switch state {
        case .simple(let wordz, let translate):
            MediumWidgetSimpleView(wordz: wordz,
                                   translate: translate)
        case .filled(let wordz, let translate, let example):
            MediumWidgetFilledView(wordz: wordz,
                                   translate: translate,
                                   example: example)
        }
        
    }
    
}

struct TodayWidgetMediumView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetMediumView(.simpleWordState)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            TodayWidgetMediumView(.longWordState)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            TodayWidgetMediumView(.nonExampleWordState)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
    
}
