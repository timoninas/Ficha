//
//  CustomGradientView.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 14.09.2022.
//

import SwiftUI

struct CustomGradientView : View {
    
    // MARK: - Public properties
    
    enum TypeGradient {
        case angled
        case simple
    }
    
    public var typeGradient: TypeGradient
    public var firstColor: Color
    public var secondColor: Color
    
    // MARK: - Private properties
    
    private var startPoint: UnitPoint {
        switch self.typeGradient {
        case .angled:
            return .init(x: 0.0, y: 0.0)
        case .simple:
            return .top
        }
    }
    
    private var endPoint: UnitPoint {
        switch self.typeGradient {
        case .angled:
            return .init(x: 1.0, y: 1.0)
        case .simple:
            return .bottom
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        LinearGradient(gradient: Gradient(
            stops: [
                .init(color: firstColor, location: 0.0),
                .init(color: secondColor, location: 1.0)
            ]
        ),
                       startPoint: startPoint,
                       endPoint: endPoint)
    }
    
}
