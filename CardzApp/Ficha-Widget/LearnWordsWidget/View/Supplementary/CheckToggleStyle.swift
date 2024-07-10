//
//  CheckToggleStyle.swift
//  CardzApp
//
//  Created by Anton Timonin on 10.07.2024.
//

import WidgetKit
import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    
    var onToggleImage: (Bool) -> Image
    var imageColor: Color
    
    init(imageColor: Color,
         _ onToggleImage: @escaping (Bool) -> Image) {
        self.onToggleImage = onToggleImage
        self.imageColor = imageColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                self.onToggleImage(configuration.isOn)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.imageColor)
            } icon: { }
        }
        .buttonStyle(.plain)
    }
}
