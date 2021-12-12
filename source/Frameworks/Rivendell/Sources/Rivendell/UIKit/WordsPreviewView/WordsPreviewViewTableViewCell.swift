//
//  File.swift
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

}
