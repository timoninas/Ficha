//
//  FichaSmallView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 18.01.2022.
//

import SwiftUI

struct FichaSmallView : View {
    
    var shot: WordShot
    
    init(_ shot: WordShot) {
        self.shot = shot
    }

    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(
                stops: [
                    .init(color: Color(.sRGB, red: 94.0 / 255.0, green: 107.0 / 255.0, blue: 250.0 / 255.0, opacity: 0.85), location: 0),
                    .init(color: Color(.sRGB, red: 173.0 / 255.0, green: 0.0 / 255.0, blue: 254.0 / 255.0, opacity: 0.85), location: 1.0)
                ]
            ),
                           startPoint: .top,
                           endPoint: .bottom)
            
            VStack {
                Text(shot.wordz)
                    .font(.system(size: 29, weight: .heavy, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.titleLineCount)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(.white)
                Text(shot.translate)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(self.shot.subtitleLineCount)
                    .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                    .foregroundColor(.white)
            }
            
            if self.shot.canShowLogo {
                HStack {
                    VStack {
                        Image("ficha-logo")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, 10.0)
                .padding(.leading, 10.0)
            }
            
            
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
}

struct FichaSmallView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FichaSmallView(.simpleWordShot)
        }
    }
}
