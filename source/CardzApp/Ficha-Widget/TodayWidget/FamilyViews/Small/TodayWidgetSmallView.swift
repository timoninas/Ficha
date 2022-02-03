//
//  TodayWidgetSmallView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI
import Rivendell

struct TodayWidgetSmallView : View {
    
    var shot: TodayWordShot
    
    init(_ shot: TodayWordShot) {
        self.shot = shot
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(
                stops: [
                    .init(color: Color.wowFir, location: 0.0),
                    .init(color: Color.wowSec, location: 1.0)
                ]
            ),
                           startPoint: .init(x: 0.0, y: 0.0),
                           endPoint: .init(x: 1.0, y: 1.0))
            
            VStack {
                Text(shot.wordz)
                    .font(.system(size: 29, weight: .heavy, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.titleLineCount)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(Color.whisper)
                Text(shot.translate)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.subtitleLineCount)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(Color.whisper)
            }
            
            if self.shot.canShowLogo {
                FichaLogoView(
                    imageName: "ficha-logo",
                    size: CGSize(width: 23.0, height: 23.0)
                )
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
}

struct TodayWidgetSmallView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            TodayWidgetSmallView(.simpleWordShot)
        }
    }
    
}
