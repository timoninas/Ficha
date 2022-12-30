//
//  LottieView.swift
//  
//
//  Created by Anton Timonin on 30.12.2022.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    
    let lottieFile: String
    
    public init(lottieFile: String) {
        self.lottieFile = lottieFile
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(configuration: LottieConfiguration(renderingEngine: .coreAnimation))
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
