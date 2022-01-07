//
//  LearnNewWordzCollectionViewHeader.swift
//  CardzApp
//
//  Created by Антон Тимонин on 19.12.2021.
//

import UIKit

final class LearnNewWordzCollectionViewHeader: UICollectionReusableView {
    
    public static var reuseID: String { "\(String(describing: self))ID" }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Сollections of words"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    public func configure() {
        addTitle()
    }
    
    private func addTitle() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
