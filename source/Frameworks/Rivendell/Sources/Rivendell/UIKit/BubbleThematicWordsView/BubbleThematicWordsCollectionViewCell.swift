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
    
    public override var isHighlighted: Bool {
        didSet {
            let duration = isHighlighted ? 0.45 : 0.35
            let transform = isHighlighted ?
                CGAffineTransform(scaleX: 0.96, y: 0.96) : CGAffineTransform.identity
            let animations = { [weak self] in
                guard let self = self else { return }
                if !self.isHighlighted {
                    UIApplication.hapticLight()
                }
                self.transform = transform
            }
            UIView.animate(withDuration: duration,
                           delay: 0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 0.0,
                           options: [.allowUserInteraction, .beginFromCurrentState],
                           animations: animations,
                           completion: nil)
        }
    }

}
