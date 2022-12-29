//
//  AnimateTabBarController.swift
//  
//
//  Created by Anton Timonin on 27.11.2022.
//

import UIKit

public final class AnimateTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    public func tabBarController(_ tabBarController: UITabBarController,
                                 animationControllerForTransitionFrom fromVC: UIViewController,
                                 to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        AnimationTransitioningTabBar(viewControllers: self.viewControllers ?? [])
    }
    
}
