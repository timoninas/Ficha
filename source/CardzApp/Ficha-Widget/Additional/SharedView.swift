//
//  SharedView.swift
//  Ficha-WidgetExtension
//
//  Created by Антон Тимонин on 02.02.2022.
//

import SwiftUI

struct FichaLogoView : View {
    
    let image: Image
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack {
                image
                    .resizable()
                    .frame(width: size.width, height: size.height)
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 10.0)
        .padding(.leading, 10.0)
    }
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}
