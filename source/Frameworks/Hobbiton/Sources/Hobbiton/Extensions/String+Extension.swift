//
//  File.swift
//  
//
//  Created by Антон Тимонин on 01.11.2021.
//

import UIKit

public extension String {
    
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func heightForOneLine(font: UIFont?) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10.0, height: .greatestFiniteMagnitude))
        label.numberOfLines = 1
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
}
