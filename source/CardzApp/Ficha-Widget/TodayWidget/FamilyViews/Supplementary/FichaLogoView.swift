//
//  FichaLogoView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 13.09.2022.
//

import SwiftUI

struct FichaAccentableImageLogo : View {
    
    var body: some View {
        Image("ficha-logo-accentable")
            .resizable()
    }
    
}

struct FichaImageLogo : View {
    
    var body: some View {
        Image("ficha-logo")
            .resizable()
    }
    
}

struct FichaImageLogoView : View {
    
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack {
                FichaImageLogo()
                    .frame(width: size.width, height: size.height)
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 10.0)
        .padding(.leading, 10.0)
    }
    
}
