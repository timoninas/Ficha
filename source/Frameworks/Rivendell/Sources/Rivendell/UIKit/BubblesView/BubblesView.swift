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
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.updateRounding()
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        [self.bubble1, self.bubble2, self.bubble3].forEach { view in
            self.addSubview(view)
        }
        self.updateRounding()
        
        let sizeBubble1 = self.screenSize.height * 0.18
        self.bubble1.widthAnchor.constraint(equalToConstant: sizeBubble1).isActive = true
        self.bubble1.heightAnchor.constraint(equalTo: self.bubble1.widthAnchor).isActive = true
        self.bubble1.topAnchor.constraint(equalTo: self.topAnchor, constant: self.screenSize.height / 8.0).isActive = true
        self.bubble1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -sizeBubble1 / 2.15).isActive = true
        
        let sizeBubble2 = self.screenSize.height * 0.27
        self.bubble2.widthAnchor.constraint(equalToConstant: sizeBubble2).isActive = true
        self.bubble2.heightAnchor.constraint(equalTo: self.bubble2.widthAnchor).isActive = true
        self.bubble2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: sizeBubble2 / 2.15).isActive = true
        self.bubble2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.screenSize.height / 3.0).isActive = true
        
        let sizeBubble3 = self.screenSize.height * 0.4619
        self.bubble3.widthAnchor.constraint(equalToConstant: sizeBubble3).isActive = true
        self.bubble3.heightAnchor.constraint(equalTo: self.bubble3.widthAnchor).isActive = true
        self.bubble3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -sizeBubble3 / 2.15).isActive = true
        self.bubble3.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: sizeBubble3 / 2.25).isActive = true
    }
    
    private func updateRounding() {
        self.bubble1.layer.cornerRadius = self.bubble1.frame.width / 2
        self.bubble2.layer.cornerRadius = self.bubble2.frame.width / 2
        self.bubble3.layer.cornerRadius = self.bubble3.frame.width / 2
    }
}
