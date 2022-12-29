//
//  Text+Extension.swift
//  
//
//  Created by Anton Timonin on 08.10.2022.
//

import SwiftUI

public extension Text {
    
    /// Закрашивается текст градиентом.
    /// - Parameters:
    ///   - colors: Цвета, которые необходимые конвертировать в градиент.
    ///   - startPoint: Начальная точка градиента.
    ///   - endPoint: Конечная точка градиента.
    /// - Returns: Текст, закрашенный градиентом.
    func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View
    {
        self.overlay {
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(self)
        }
    }
    
}
