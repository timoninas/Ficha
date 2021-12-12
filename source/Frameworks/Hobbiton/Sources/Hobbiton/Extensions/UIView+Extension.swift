//
//  File.swift
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
    
}