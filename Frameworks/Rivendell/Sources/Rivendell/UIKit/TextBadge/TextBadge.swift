//
//  TextBadge.swift
//  
//
//  Created by Антон Тимонин on 20.12.2021.
//

import UIKit

public final class TextBadge: UIView {
    
    // MARK: - Init
    
    private struct Constants {
        static var alphaBackgroundColor: CGFloat { 0.5 }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whisper
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 11.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue)
        }
    }
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateRounding()
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        updateAppearance()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = configuration.backgroundColor.withAlphaComponent(Constants.alphaBackgroundColor)
        
        addTitle()
        
        updateAppearance()
    }
    
    private func addTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    
    private func updateAppearance() {
        updateContent()
        updateRounding()
        setupConstraints()
    }
    
    private func updateContent() {
        if titleLabel.text != configuration.title {
            titleLabel.text = configuration.title
        }
    }
    
    private func updateRounding() {
        layer.cornerRadius = configuration.cornerRadius
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        titleLabel.layoutIfNeeded()
        titleLabel.sizeToFit()
        storedConstraints += [
            heightAnchor.constraint(equalToConstant: "SomeText".heightForOneLine(font: UIFont(name:"HelveticaNeue-Bold", size: 11.0)) + 2),
            widthAnchor.constraint(equalToConstant: titleLabel.frame.width + 12.0)
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
}
