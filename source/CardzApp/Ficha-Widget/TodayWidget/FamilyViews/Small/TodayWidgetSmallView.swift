//
//  TodayWidgetSmallView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import WidgetKit

struct TodayWidgetSmallView : View {
    
    var shot: TodayWordShot
    
    init(_ shot: TodayWordShot) {
        self.shot = shot
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(
                stops: [
                    .init(color: Color.lightPurrple, location: 0.0),
                    .init(color: Color.darkPurrple, location: 1.0)
                ]
            ),
                           startPoint: .init(x: 0.0, y: 0.0),
                           endPoint: .init(x: 1.0, y: 1.0))
            
            VStack {
                Text(shot.wordz)
                    .font(.system(size: 29, weight: .heavy, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.titleLineCount)
                    .foregroundColor(Color.whisper)
                Text(shot.translate)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.subtitleLineCount)
                    .foregroundColor(Color.whisper)
            }
            
            
            .padding(EdgeInsets(top: 4.0,
                                leading: 4.0,
                                bottom: 4.0,
                                trailing: 4.0))
            
            if self.shot.canShowLogo {
                FichaLogoView(
                    image: Image("ficha-logo"),
                    size: CGSize(width: 20.0, height: 20.0)
                )
            }
            
        }
        
    }
    
}

struct TodayWidgetSmallView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetSmallView(.simpleWordShot)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            TodayWidgetSmallView(.longWordShot)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
    
}
