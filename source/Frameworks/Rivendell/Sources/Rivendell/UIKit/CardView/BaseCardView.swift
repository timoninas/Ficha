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
        /// Свайп вверх.
        case top
        /// Свайп вправо.
        case right
        /// Свайп вниз.
        case bottom
        /// Свайп влево.
        case left
    }
    
    /// Направления свайпов карточки.
    ///
    /// По умолчанию, при свайпе карточка будет возвращаться в начальное положение.
    public var swipeDirections: [SwipeDirection] = []
    
    /// Замыкание, которое сработает перед `onTap`.
    var internalOnTap: VoidClosure?
    
    /// Замыкание, которое сработает при тапе по карточке.
    public var onTap: VoidClosure?
    
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
    
    /// Замыкание, которое срабатывает при изменении позиции карточки.
    /// - Parameters:
    ///  - x: Изменение по координате `x`.
    ///  - y: Изменение по координате `y`.
    public var onCardChangedPosition:((CGFloat, CGFloat) -> Void)?
    
    public var onCardEndChangedPosition: VoidClosure?
    
    /// Вью, которая добавится в контентную область карточки.
    public var contentView: UIView = UIView() {
        didSet {
            self.addContentViewIfNeeded(oldView: oldValue)
        }
    }
    
    private struct Constants {
        static var threshold: CGFloat { 60.0 }
    }
    
    // MARK: - Init
    
    /// Инициализирует объект свайпающаяся карточка.
    /// - Parameters:
    ///  - swipeDirections: Направления свайпов.
    public init(
        swipeDirections: [SwipeDirection]
    ) {
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
        self.backgroundColor = .whisper
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addContentViewIfNeeded(oldView: UIView?) {
        if let view = oldView, view.superview != nil {
            view.removeFromSuperview()
        }
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        if self.contentView.superview == nil {
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
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(gesture:)))
        self.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleCardMoving(gesture:)))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handleCardTap(gesture: UIPanGestureRecognizer) {
        internalOnTap?()
        onTap?()
    }
    
    @objc fileprivate func handleCardMoving(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .changed:
            let transition = gesture.translation(in: nil)
            self.onCardChangedPosition?(transition.x, transition.y)
            self.handleCardChanged(gesture)
        case .ended:
            self.handleCardEnded(gesture)
            self.onCardEndChangedPosition?()
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
        let currentPoint = gesture.translation(in: nil)
        let responseSwipeRequest = countDirection(currentCardPosition: currentPoint)
        let shouldDismissCard = abs(currentPoint.x) > Constants.threshold || abs(currentPoint.y) > Constants.threshold
        
        UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.03, options: .curveEaseIn) {
            if let responseSwipeRequest = responseSwipeRequest, shouldDismissCard && !self.swipeDirections.isEmpty {
                let offScreenTransform = self.transform.translatedBy(x: responseSwipeRequest.1.x, y: responseSwipeRequest.1.y)
                self.transform = offScreenTransform
            } else {
                self.transform = .identity
            }
        } completion: { [weak self] _ in
            guard let self = self else { return }
            guard let responseSwipeRequest = responseSwipeRequest, shouldDismissCard && !self.swipeDirections.isEmpty else {
                self.onDragCard?()
                return
            }
            self.removeFromSuperview()
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
    
    private func countDirection(currentCardPosition: CGPoint) -> (SwipeDirection, CGPoint)? {
        let topThreshold = CGPoint(x: 0.0, y: -1000.0)
        let bottomThreshold = CGPoint(x: 0.0, y: 1000.0)
        let rightThreshold = CGPoint(x: 1000.0, y: 0.0)
        let leftThreshold = CGPoint(x: -1000.0, y: 0.0)
        var defaultMinDistance: CGFloat = 20000.0
        var defaultDirection: SwipeDirection = .left
        var defaultPoint = CGPoint(x: 0.0, y: 0.0)
        
        let allSwipeDirection: [SwipeDirection] = [.top, .left, .right, .bottom]
        
        allSwipeDirection.forEach { direction in
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
        
        return swipeDirections.contains(defaultDirection)
        ? (defaultDirection, defaultPoint)
        : nil
    }
    
    private func updateAppearance() {
        updateRounding()
    }
    
    private func updateRounding() {
        self.layer.cornerRadius = self.frame.height * 0.05
    }
    
    // MARK: - Public methods
    
    /// Заменяет все события срабатывающие на свайпы в разные стороны.
    /// - Parameters:
    ///  - completion: Замыкание, которое будет срабатывать. Можно обнулить, поставив `nil`.
    public func onEverySwipe(completion: VoidClosure?) {
        onTopSwipe = completion
        onRightSwipe = completion
        onBottomSwipe = completion
        onLeftSwipe = completion
    }
    
    /// Сообщает, что нужно свайпнуть карточку в определенную сторону.
    ///
    /// - Parameters:
    ///   - swipeDirection: Направление свайпа.
    ///
    /// - Attention: Лучше писать такие экраны, чтобы не приходилось вызывать свайп снаружи.
    public func swipeTo(_ swipeDirection: SwipeDirection) {
        let point: CGPoint
        
        switch swipeDirection {
        case .top:
            point = CGPoint(x: 0.0, y: -1000.0)
        case .right:
            point = CGPoint(x: 1000.0, y: 0.0)
        case .bottom:
            point = CGPoint(x: 0.0, y: 1000.0)
        case .left:
            point = CGPoint(x: -1000.0, y: 0.0)
        }
        
        UIView.animate(
            withDuration: 0.55,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.3,
            options: .curveEaseIn
        ) {
            let offScreenTransform = self.transform.translatedBy(x: point.x, y: point.y)
            self.transform = offScreenTransform
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
            switch swipeDirection {
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
    
}

public extension BaseCardView {
    
    /// Инициализирует фантомную карточку, к которой будут верстаться кнопки.
    /// - Returns: Невидимая  `BaseCardView` карточка.
    static func phantomCard() -> BaseCardView {
        let phantomCard = BaseCardView(swipeDirections: [])
        phantomCard.alpha = 0.0
        phantomCard.isUserInteractionEnabled = false
        return phantomCard
    }
    
}
