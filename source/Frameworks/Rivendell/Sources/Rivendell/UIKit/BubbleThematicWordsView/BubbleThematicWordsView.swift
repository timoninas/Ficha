//
//  BubbleThematicWordsView.swift
//  
//
//  Created by Антон Тимонин on 15.12.2021.
//

import UIKit
import Hobbiton

public final class BubbleThematicWordsView: UIView {
    
    // MARK: - Public properties
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue)
        }
    }
    
    // MARK: - Private properties
    
    private struct Constants {
        static var cornerRadiusTextBadge: CGFloat { 4.0 }
    }
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue", size: 12.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var textBadge = TextBadge(configuration: .init(title: "")
                                        .with(cornerRadius: Constants.cornerRadiusTextBadge))
    
    private var storedConstraints = [NSLayoutConstraint]()
    
    // MARK: - Init
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateRounding()
    }
    
    private func updateRounding() {
        layer.cornerRadius = configuration.cornerRadius
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = frame.height * 0.035
        contentView.layer.cornerRadius = configuration.cornerRadius
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        updateAppearance()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addContentView()
        addTitleLabel()
        addIconImage()
        
        addTextBadge()
        
        updateAppearance()
    }
    
    private func addContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
    }
    
    private func addIconImage() {
        contentView.addSubview(iconImageView)
    }
    
    private func addTextBadge() {
        contentView.addSubview(textBadge)
    }
    
    private func updateAppearance() {
        updateContent()
        setupConstraints()
    }
    
    private func updateContent() {
        titleLabel.text = configuration.title
        iconImageView.image = configuration.iconImage
        backgroundColor = configuration.backgroundColor
        
        textBadge.configuration = textBadge.configuration
            .with(title: configuration.badgeText)
        textBadge.alpha = configuration.badgeText.isEmpty ? 0.0 : 1.0
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        storedConstraints += [
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4.0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2.0),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2.0),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.heightForOneLine()),
        ]
        
        storedConstraints += [
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9.0),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 9.0),
            iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -9.0),
            iconImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -4.0),
        ]
        
        storedConstraints += [
            textBadge.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6.0),
            textBadge.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.0),
            textBadge.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -8.0)
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
}
