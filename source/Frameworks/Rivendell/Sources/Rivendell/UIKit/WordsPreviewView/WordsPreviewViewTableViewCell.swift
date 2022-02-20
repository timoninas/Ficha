//
//  WordsPreviewViewTableViewCell.swift
//  
//
//  Created by Антон Тимонин on 12.12.2021.
//

import UIKit

public final class WordsPreviewViewTableViewCell: UITableViewCell {
    
    public static var reuseID: String { "\(String(describing: self))ID" }

    let wordsPreviewView = WordsPreviewView(configuration: .init(title: ""))

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
        }
    
    private func configureUI() {
        wordsPreviewView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wordsPreviewView)
        NSLayoutConstraint.activate([
            wordsPreviewView.topAnchor.constraint(equalTo: topAnchor),
            wordsPreviewView.leftAnchor.constraint(equalTo: leftAnchor),
            wordsPreviewView.rightAnchor.constraint(equalTo: rightAnchor),
            wordsPreviewView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configure(configuration: WordsPreviewView.Configuration) {
        wordsPreviewView.configuration = configuration
    }
    
    public override var isHighlighted: Bool {
        didSet {
            let duration = isHighlighted ? 0.45 : 0.4
            let transform = isHighlighted ?
                CGAffineTransform(scaleX: 0.96, y: 0.96) : CGAffineTransform.identity
            let animations = {
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
