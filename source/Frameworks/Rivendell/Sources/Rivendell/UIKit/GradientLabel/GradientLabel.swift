//
//  GradientLabel.swift
//  
//
//  Created by Антон Тимонин on 20/02/2022.
//

import UIKit

class GradientLabel: UIStackView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        axis = .vertical
        alignment = .center
        
        addArrangedSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradient = UIImage.gradientImage(bounds: label.bounds, colors: [.systemBlue, .systemRed])
        label.textColor = UIColor(patternImage: gradient)
    }
    
}
