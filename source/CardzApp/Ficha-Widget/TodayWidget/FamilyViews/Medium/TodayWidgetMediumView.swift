//
//  FichaMediumView.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 02.02.2022.
//

import SwiftUI

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
                        .init(color: Color.wowSec, location: 0.0),
                        .init(color: Color.wowFir, location: 1.0)
                    ]
                ),
                               startPoint: .top,
                               endPoint: .bottom)
            } else {
                LinearGradient(gradient: Gradient(
                    stops: [
                        .init(color: Color.wowFir, location: 0.0),
                        .init(color: Color.wowSec, location: 1.0)
                    ]
                ),
                               startPoint: .init(x: 0.0, y: 0.0),
                               endPoint: .init(x: 1.0, y: 1.0))
            }
            
            HStack(spacing: 8.0) {
                if shot.example != nil {
                    Color.wowSec
                        .cornerRadius(30.0, corners: [.bottomRight])
                    Color.wowFir
                        .cornerRadius(30.0, corners: [.topLeft])
                }
            }
            
            HStack(spacing: 0.0) {
                VStack {
                    Text(shot.wordz)
                        .font(.system(size: 29, weight: .heavy, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineLimit(self.shot.titleLineCount)
                        .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                        .foregroundColor(Color.whisper)
                    Text(shot.translate)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineLimit(self.shot.subtitleLineCount)
                        .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                        .foregroundColor(Color.whisper)
                        .padding(.leading, 10.0)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                if let example = shot.example {
                    VStack {
                        Text(example)
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .lineLimit(8)
                            .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                            .foregroundColor(Color.whisper)
                            .ignoresSafeArea()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
            }
            
            if self.shot.canShowLogo {
                FichaLogoView(
                    image: Image("ficha-logo"),
                    size: CGSize(width: 23.0, height: 23.0)
                )
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
}
