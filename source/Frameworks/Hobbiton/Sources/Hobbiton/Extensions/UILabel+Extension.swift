//
//  File.swift
//  
//
//  Created by Антон Тимонин on 01.11.2021.
//

import UIKit

public extension UILabel {

    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))
        attributedText = attributedString
    }
    
    var expectedHeight: CGFloat {
        self.sizeToFit()
        return self.frame.height
    }
    
    var numberOfVisibleLines: CGFloat {
        self.layoutIfNeeded()
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return textHeight / lineHeight
    }
    
    

}

