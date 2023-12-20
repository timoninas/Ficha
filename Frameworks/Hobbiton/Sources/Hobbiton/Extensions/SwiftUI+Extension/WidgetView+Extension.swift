//
//  WidgetView+Extension.swift
//
//
//  Created by Anton Timonin on 20.12.2023.
//

import SwiftUI
import WidgetKit

public extension View {
    
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
