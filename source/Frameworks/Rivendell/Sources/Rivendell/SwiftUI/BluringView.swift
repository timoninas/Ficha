//
//  BlurView.swift
//  
//
//  Created by Anton Timonin on 08.10.2022.
//

import SwiftUI

public struct BluringView: UIViewRepresentable {
    
    public let style: UIBlurEffect.Style
    
    public init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    public func makeUIView(context: UIViewRepresentableContext<BluringView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    public func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BluringView>) {}
    
}
