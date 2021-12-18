//
//  File.swift
//  
//
//  Created by Антон Тимонин on 18.12.2021.
//

import UIKit

public class NavigationController : UINavigationController {
    
    public override var preferredStatusBarStyle : UIStatusBarStyle {
        
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        
        return .darkContent
    }
}
