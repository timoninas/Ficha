//
//  AnimationTransitioningTabBar.swift
//  
//
//  Created by Anton Timonin on 27.11.2022.
//

import UIKit

public final class AnimationTransitioningTabBar: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Private properties
    
    private struct Constants {
        static let xOffset: CGFloat = 10.0
    }
    
    private let viewControllers: [UIViewController]
    private let transitionDuration: TimeInterval
    
    // MARK: - Init
    
    init(viewControllers: [UIViewController],
         transitionDuration: TimeInterval = 0.3) {
        self.viewControllers = viewControllers
        self.transitionDuration = transitionDuration
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        self.transitionDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let fromIdx = self.indexFor(vc: fromVC),
            let toVC = transitionContext.viewController(forKey: .to),
            let toView = toVC.view,
            let toIdx = self.indexFor(vc: toVC)
        else {
            return
        }
        
        let transitionDirection: CGFloat = Constants.xOffset * CGFloat(fromIdx > toIdx ? -1 : 1)
        toView.transform = CGAffineTransform(translationX: transitionDirection, y: 0)
        toView.alpha = 0
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: self.transitionDuration, animations: {
            toView.alpha = 1.0
            toView.transform = .identity
        }) { success in
            transitionContext.completeTransition(success)
        }
    }
    
    // MARK: - Private methods
    
    func indexFor(vc viewController: UIViewController) -> Int? {
        for (idx, vc) in  self.viewControllers.enumerated() {
            if viewController == vc {
                return idx
            }
        }
        return nil
    }
    
}
