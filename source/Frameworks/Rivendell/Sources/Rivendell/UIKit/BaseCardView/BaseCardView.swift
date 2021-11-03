//
//  File.swift
//  
//
//  Created by Антон Тимонин on 30.10.2021.
//

import UIKit
import Hobbiton

/// Базовая, свайпающаяся карточка
public class BaseCardView: UIView {
    
    // MARK: - Public properties
    
    /// Enum, с направлением свайпов карточки.
    public enum SwipeDirection {
        case top
        case right
        case bottom
        case left
    }
    
    /// Направления свайпов карточки.
    ///
    /// По умолчанию, при свайпе карточка будет возвращаться в начальное положение.
    public var swipeDirections: [SwipeDirection] = []
    
    /// Замыкание, которое сработает при свайпе вверх.
    public var onTopSwipe: VoidClosure?
    
    /// Замыкание, которое сработает при свайпе вправо.
    public var onRightSwipe: VoidClosure?
    
    /// Замыкание, которое сработает при свайпе вниз.
    public var onBottomSwipe: VoidClosure?
    
    /// Замыкание, которое сработает при свайпе влево.
    public var onLeftSwipe: VoidClosure?
    
    /// Замыкание, которое при смещении карточки с места.
    public var onDragCard: VoidClosure?
    
    /// Вью, которая добавится в контентную область карточки.
    public var contentView: UIView = UIView() {
        didSet {
            self.addContentViewIfNeeded(oldView: oldValue)
        }
    }
    
    // MARK: - Init
    
    /// Инициализирует объект свайпающаяся карточка.
    /// - Parameters:
    ///  - swipeDirections: Направления свайпов.
    public init(swipeDirections: SwipeDirection...) {
        self.swipeDirections = swipeDirections
        super.init(frame: .zero)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.updateRounding()
    }
    
    private func configureUI() {
        self.configureView()
        self.addContentViewIfNeeded(oldView: nil)
        self.addCardGestureRecognizer()
        
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
            self.handleCardEnded(gesture)
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
    
    fileprivate func handleCardEnded(_ gesture: UIPanGestureRecognizer) {
        let threshold: CGFloat = 80.0
        let currentPoint = gesture.translation(in: nil)
        let responseSwipeRequest = countDirection(currentCardPosition: currentPoint)
        let shouldDismissCard = abs(currentPoint.x) > threshold || abs(currentPoint.y) > threshold
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            if shouldDismissCard && !self.swipeDirections.isEmpty {
                let offScreenTransform = self.transform.translatedBy(x: responseSwipeRequest.1.x, y: responseSwipeRequest.1.y)
                self.transform = offScreenTransform
            } else {
                self.transform = .identity
            }
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.transform = .identity
            guard shouldDismissCard && !self.swipeDirections.isEmpty else {
                self.onDragCard?()
                return
            }
            switch responseSwipeRequest.0 {
            case .top:
                self.onTopSwipe?()
            case .bottom:
                self.onBottomSwipe?()
            case .left:
                self.onLeftSwipe?()
            case .right:
                self.onRightSwipe?()
            }
        }
    }
    
    private func countDistance(_ point1: CGPoint, point2: CGPoint) -> CGFloat {
        CGFloat(
            sqrtf(
                Float( pow( point1.x - point2.x, 2 ) )
                + Float( pow( point1.y - point2.y, 2 ) )
            )
        )
    }
    
    private func countDirection(currentCardPosition: CGPoint) -> (SwipeDirection, CGPoint) {
        let topThreshold = CGPoint(x: 0.0, y: -1000.0)
        let bottomThreshold = CGPoint(x: 0.0, y: 1000.0)
        let rightThreshold = CGPoint(x: 1000.0, y: 0.0)
        let leftThreshold = CGPoint(x: -1000.0, y: 0.0)
        var defaultMinDistance: CGFloat = 2000.0
        var defaultDirection: SwipeDirection = .left
        var defaultPoint = CGPoint(x: 0.0, y: 0.0)
        
        swipeDirections.forEach { direction in
            var currentDistance: CGFloat
            var currentPoint: CGPoint
            switch direction {
            case .top:
                currentDistance = countDistance(currentCardPosition, point2: topThreshold)
                currentPoint = topThreshold
            case .bottom:
                currentDistance = countDistance(currentCardPosition, point2: bottomThreshold)
                currentPoint = bottomThreshold
            case .right:
                currentDistance = countDistance(currentCardPosition, point2: rightThreshold)
                currentPoint = rightThreshold
            case .left:
                currentDistance = countDistance(currentCardPosition, point2: leftThreshold)
                currentPoint = leftThreshold
            }
            if defaultMinDistance > currentDistance {
                defaultMinDistance = currentDistance
                defaultDirection = direction
                defaultPoint = currentPoint
            }
        }
        
        return (defaultDirection, defaultPoint)
    }
    
    private func updateAppearance() {
        updateRounding()
    }
    
    private func updateRounding() {
        self.layer.cornerRadius = self.frame.height * 0.05
    }
    
}
