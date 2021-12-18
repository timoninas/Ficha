//
//  BubbleThematicWordsCollectionViewCell.swift
//  
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation

import UIKit

public final class BubbleThematicWordsCollectionViewCell: UICollectionViewCell {
    
    public static var reuseID: String { "\(String(describing: self))ID" }

    let bubbleThematicWordsView = BubbleThematicWordsView(configuration: .init(title: ""))

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI() {
        isUserInteractionEnabled = true
        contentView.isUserInteractionEnabled = true
        addSubview(bubbleThematicWordsView)
        NSLayoutConstraint.activate([
            bubbleThematicWordsView.topAnchor.constraint(equalTo: topAnchor),
            bubbleThematicWordsView.leftAnchor.constraint(equalTo: leftAnchor),
            bubbleThematicWordsView.rightAnchor.constraint(equalTo: rightAnchor),
            bubbleThematicWordsView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configure(configuration: BubbleThematicWordsView.Configuration) {
        bubbleThematicWordsView.configuration = configuration
    }

}
