//
//  UIApplication+Extension.swift
//  
//
//  Created by Антон Тимонин on 09.11.2021.
//

import UIKit

public extension UIApplication {
    
    static var statusBarHeight: CGFloat {
        let window = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        return height
    }
    
    static func hapticLight() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    static func hapticMedium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    static func hapticHeavy() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    static func hapticSoft() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
    }
    
}

