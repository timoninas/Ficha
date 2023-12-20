//
//  PresentationWordWithTranslateView.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import Rivendell
import SwiftUI

struct PresentationWordWithTranslateView : View {
    
    var wordz: String
    var examples: [String]
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(spacing: 0.0) {
                self.mainTitle(title: wordz)
                self.examplesTitles(examples: examples)
            }
            .padding(EdgeInsets(top: 12.0,
                                leading: 0.0,
                                bottom: 12.0,
                                trailing: 0.0))
            .background(BluringView(style: .light))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .padding(EdgeInsets(top: 8.0,
                                leading: 12.0,
                                bottom: 8.0,
                                trailing: 12.0))
        }
        
    }
    
    @ViewBuilder
    private func mainTitle(title: String) -> some View {
        HStack(spacing: 0.0) {
            Spacer()
            Text(title)
                .font(.system(size: 36.0, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.mysteryShack)
                .padding(EdgeInsets(top: 0.0,
                                    leading: 16.0,
                                    bottom: 8.0,
                                    trailing: 16.0))
            Spacer()
        }
    }
    
    @ViewBuilder
    private func examplesTitles(examples: [String]) -> some View {
        if examples.filter({ !$0.isEmpty }).isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 8.0) {
                ForEach(examples, id: \.self) { word in
                    HStack(alignment: .center,
                           spacing: 0.0) {
                        Text(word)
                            .font(.system(size: 20.0, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.nazgul)
                            .padding(EdgeInsets(top: 8.0,
                                                leading: 16.0,
                                                bottom: 0.0,
                                                trailing: 16.0))
                        Spacer()
                    }
                    
                    
                }
                Spacer()
            }
        }
    }
    
}
