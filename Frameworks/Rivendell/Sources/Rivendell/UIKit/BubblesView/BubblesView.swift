//
//  BubblesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import UIKit

public final class BubblesView: UIView {
    
    let bubble1: UIView = {
        let view = UIView()
        view.backgroundColor = .galadriel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bubble2: UIView = {
        let view = UIView()
        view.backgroundColor = .galadriel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bubble3: UIView = {
        let view = UIView()
        view.backgroundColor = .galadriel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    public init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateRounding()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        [bubble1, bubble2, bubble3].forEach { view in
            addSubview(view)
        }
        updateRounding()
        
        let sizeBubble1 = screenSize.height * 0.18
        bubble1.widthAnchor.constraint(equalToConstant: sizeBubble1).isActive = true
        bubble1.heightAnchor.constraint(equalTo: bubble1.widthAnchor).isActive = true
        bubble1.topAnchor.constraint(equalTo: topAnchor, constant: screenSize.height / 8.0).isActive = true
        bubble1.leftAnchor.constraint(equalTo: leftAnchor, constant: -sizeBubble1 / 2.15).isActive = true
        
        let sizeBubble2 = screenSize.height * 0.27
        bubble2.widthAnchor.constraint(equalToConstant: sizeBubble2).isActive = true
        bubble2.heightAnchor.constraint(equalTo: bubble2.widthAnchor).isActive = true
        bubble2.rightAnchor.constraint(equalTo: rightAnchor, constant: sizeBubble2 / 2.15).isActive = true
        bubble2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -screenSize.height / 3.0).isActive = true
        
        let sizeBubble3 = screenSize.height * 0.4619
        bubble3.widthAnchor.constraint(equalToConstant: sizeBubble3).isActive = true
        bubble3.heightAnchor.constraint(equalTo: bubble3.widthAnchor).isActive = true
        bubble3.leftAnchor.constraint(equalTo: leftAnchor, constant: -sizeBubble3 / 2.15).isActive = true
        bubble3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: sizeBubble3 / 2.25).isActive = true
    }
    
    private func updateRounding() {
        bubble1.layer.cornerRadius = bubble1.frame.width / 2
        bubble2.layer.cornerRadius = bubble2.frame.width / 2
        bubble3.layer.cornerRadius = bubble3.frame.width / 2
    }
}
