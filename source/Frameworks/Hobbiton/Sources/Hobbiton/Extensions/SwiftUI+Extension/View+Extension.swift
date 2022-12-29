//
//  View+Extension.swift
//  
//
//  Created by Anton Timonin on 07.10.2022.
//

import SwiftUI

extension View {
    
    /// Центрирует `View` по выбранной оси.
    @ViewBuilder
    func center ( _ axis: Axis)-> some View {
        switch axis {
        case .horizontal:
            HStack {
                Spacer()
                self
                Spacer()
            }
        case .vertical:
            VStack {
                Spacer()
                self
                Spacer()
            }
        }
    }
    
}
