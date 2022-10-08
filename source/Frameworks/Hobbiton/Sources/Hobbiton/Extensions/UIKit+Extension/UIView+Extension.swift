//
//  UIView+Extension.swift
//  
//
//  Created by Антон Тимонин on 01.11.2021.
//

import UIKit

public extension UIView {
    
    var safeAreaHeight: CGFloat {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.layoutFrame.size.height
        }
        return bounds.height
    }
    
    func withCardShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.urukhigh.withAlphaComponent(0.15).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 5
    }
    
}
