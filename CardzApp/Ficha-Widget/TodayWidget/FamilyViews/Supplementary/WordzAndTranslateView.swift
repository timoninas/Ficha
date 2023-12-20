//
//  WordzAndTranslateView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 14.09.2022.
//

import SwiftUI

struct WordzAndTranslateView : View {
    
    var wordz: String
    var translate: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Text(wordz)
                .font(.system(size: 26, weight: .heavy, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                .foregroundColor(Color.whisper)
            
            Text(translate)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                .foregroundColor(Color.whisper)
                .padding(.leading, 10.0)
        }
    }
}
