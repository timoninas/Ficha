//
//  ExamplesWordsView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 14.09.2022.
//

import SwiftUI

struct ExamplesWordsView : View {
    
    var example: String
    
    var body: some View {
        VStack {
            Text(example)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(8)
                .padding(EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0))
                .foregroundColor(Color.whisper)
                .ignoresSafeArea()
        }
    }
    
}
