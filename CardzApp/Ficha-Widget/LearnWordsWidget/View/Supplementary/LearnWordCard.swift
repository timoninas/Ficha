//
//  LearnWordCard.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 03.01.2024.
//

import SwiftUI

struct LearnWordCard: View {
    
    // MARK: - Properties
    
    let title: String
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            Text(title)
                .font(.system(size: 24,
                               weight: .heavy,
                               design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .foregroundColor(Color.black)
                .padding(.all(4.0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.whisper.opacity(0.98))
        .clipShape(.rect(cornerSize: .init(width: 13.0, height: 13.0), style: .continuous))
        .id(title)
    }
}
