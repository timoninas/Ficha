//
//  FichaMediumView.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 02.02.2022.
//

import SwiftUI
import WidgetKit

struct TodayWidgetMediumView : View {
    
    var shot: TodayWordShot
    
    init(_ shot: TodayWordShot) {
        self.shot = shot
    }
    
    var body: some View {
        ZStack {
            
            if shot.example != nil {
                LinearGradient(gradient: Gradient(
                    stops: [
                        .init(color: Color.darkPurrple, location: 0.0),
                        .init(color: Color.lightPurrple, location: 1.0)
                    ]
                ),
                               startPoint: .top,
                               endPoint: .bottom)
            } else {
                LinearGradient(gradient: Gradient(
                    stops: [
                        .init(color: Color.lightPurrple, location: 0.0),
                        .init(color: Color.darkPurrple, location: 1.0)
                    ]
                ),
                               startPoint: .init(x: 0.0, y: 0.0),
                               endPoint: .init(x: 1.0, y: 1.0))
            }
            
            HStack(spacing: 8.0) {
                if shot.example != nil {
                    Color.darkPurrple
                        .cornerRadius(30.0, corners: [.bottomRight])
                    Color.lightPurrple
                        .cornerRadius(30.0, corners: [.topLeft])
                }
            }
            
            GeometryReader { geometry in
                
                HStack(alignment: .center, spacing: 0.0, content: {
                    
                    VStack(alignment: .center, spacing: 0.0) {
                        Text(shot.wordz)
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .multilineTextAlignment(.center)
                            .lineLimit(self.shot.titleLineCount)
                            .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                            .foregroundColor(Color.whisper)
                        
                        Text(shot.translate)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .lineLimit(self.shot.subtitleLineCount)
                            .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                            .foregroundColor(Color.whisper)
                            .padding(.leading, 10.0)
                    }
                    
                    .frame(width: geometry.size.width / (shot.example == nil ? 1.0 : 2.0) - (shot.example == nil ? 0.0 : 6.0),
                           height: geometry.size.height, alignment: .center)
                    
                    
                    if let example = shot.example {
                        HStack(spacing: 0.0) {
                            Spacer()
                            VStack {
                                Text(example)
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(8)
                                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                                    .foregroundColor(Color.whisper)
                                    .ignoresSafeArea()
                            }
                            .frame(width: geometry.size.width / 2.0 - 10.0,
                                   height: geometry.size.height, alignment: .center)
                        }
                    }
                    
                })
                
            }
            .padding(EdgeInsets(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0))
            
            
            
            if self.shot.canShowLogo {
                FichaLogoView(
                    image: Image("ficha-logo"),
                    size: CGSize(width: 23.0, height: 23.0)
                )
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
}

struct TodayWidgetMediumView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetMediumView(.simpleWordShot)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            TodayWidgetMediumView(.longWordShot)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            TodayWidgetMediumView(.nonExampleWordShot)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
    
}
