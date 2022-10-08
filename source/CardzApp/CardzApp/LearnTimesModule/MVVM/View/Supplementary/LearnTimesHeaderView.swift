//
//  LearnTimesHeaderView.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import Hobbiton
import SwiftUI

struct LearnTimesHeaderView : View {
    var title: String
    var subtitle: String?
    var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                self.mainTitle(title: title)
                VStack(alignment: .center) {
                    self.titleImage(image: image)
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 8.0,
                            leading: 16.0,
                            bottom: 8.0,
                            trailing: 16.0))
    }
    
    @ViewBuilder
    private func mainTitle(title: String) -> some View {
        Text(title)
            .foregroundLinearGradient(
                colors: [.mysteryShack,
                         .mysteryShack,
                         .mysteryShack,
                         .babushka.opacity(1.0)],
                startPoint: .leading,
                endPoint: .trailing
            )
            .foregroundColor(.nazgul)
            .font(.system(size: 24.0, weight: .bold, design: .rounded))
            .multilineTextAlignment(.leading)
            .lineLimit(1)
    }
    
    @ViewBuilder
    private func titleImage(image: Image?) -> some View {
        if let image {
            
                image
                    .resizable()
                    .frame(width: 13.0,
                           height: 13.0)
        } else {
            EmptyView()
        }
    }
    
}
