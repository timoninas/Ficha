//
//  File.swift
//  
//
//  Created by Антон Тимонин on 30.10.2021.
//

import UIKit

public class BaseCardView: UIView {
    
    public enum SwipeDirections {
        case top
        case right
        case bottom
        case left
    }
    
    public typealias VoidClosure = () -> Void
    
    public var onTopSwipe: VoidClosure?
    public var onRightSwipe: VoidClosure?
    public var onBottomSwipe: VoidClosure?
    public var onLeftSwipe: VoidClosure?
    
    public var contentView: UIView = UIView() {
        didSet {
            self.addContentViewIfNeeded(oldView: oldValue)
        }
    }
    
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
        self.configureView()
        self.addContentViewIfNeeded(oldView: nil)
        self.addCardGestureRecognizer()
        
        self.setupConstraints()
        self.updateAppearance()
    }
    
    private func configureView() {
        self.backgroundColor = .blue
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addContentViewIfNeeded(oldView: UIView?) {
        if let view = oldView, view.superview != nil {
            view.removeFromSuperview()
        }
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        if self.contentView.superview == nil {
            self.contentView.backgroundColor = .green
            self.addSubview(self.contentView)
            let padding = 20.0
            NSLayoutConstraint.activate([
                self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
                self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
                self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
            ])
        }
    }
    
    private func addCardGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleCardMoving(gesture:)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handleCardMoving(gesture: UIPanGestureRecognizer) {
        
        
        switch gesture.state {
        case .changed:
            self.handleCardChanged(gesture)
        case .ended:
            self.handleCardEnded()
        default: break
        }
        
    }
    
    fileprivate func handleCardChanged(_ gesture: UIPanGestureRecognizer) {
        let transition = gesture.translation(in: nil)
        
        let degrees: CGFloat = transition.x / 20.0
        let angle = degrees * 3.14 / 180
        
        let rotationalTranformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTranformation.translatedBy(x: transition.x, y: transition.y)
    }
    
    fileprivate func handleCardEnded() {
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.transform = .identity
        } completion: { _ in
            print("keke")
        }
    }
    
    private func setupConstraints() {
        
//        NSLayoutConstraint.activate([
//            self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6428)
//        ])
        
        
    }
    
    private func updateAppearance() {
        updateRounding()
    }
    
    private func updateRounding() {
        self.layer.cornerRadius = self.frame.height * 0.05
    }
    
}
