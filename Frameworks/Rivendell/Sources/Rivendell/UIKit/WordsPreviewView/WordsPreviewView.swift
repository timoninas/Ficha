//
//  WordsPreviewView.swift
//  
//
//  Created by Антон Тимонин on 12.12.2021.
//

import UIKit
import Hobbiton

public final class WordsPreviewView: UIView {
    
    // MARK: - Init
    
    private struct Constants {
        static var bulbOffset: CGFloat { 50.0 }
        static var titleLeftAnchor: CGFloat { 20.0 }
        static var topAnchor: CGFloat { 10.0 }
    }
    
    private let contentView = UIView()
    
    private let rightContentView = UIView()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private var wordzExampleGen: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue", size: 16.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    private var isDoneImage = MergerImagerView()
    
    private var labels: [UILabel] = []
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue)
        }
    }
    
    private var storedConstraints = [NSLayoutConstraint]()
    
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
        setupConstraints()
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        
        updateAppearance()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addContentView()
        addMainLabel()
        addIsDoneImage()
        
        updateAppearance()
    }
    
    private func addContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        rightContentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightContentView)
    }
    
    private func addMainLabel() {
        contentView.addSubview(mainLabel)
    }
    
    private func addIsDoneImage() {
        rightContentView.addSubview(isDoneImage)
    }
    
    private func updateAppearance() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        updateContent()
        
        storedConstraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        storedConstraints += [
            rightContentView.topAnchor.constraint(equalTo: topAnchor),
            rightContentView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.titleLeftAnchor),
            rightContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightContentView.widthAnchor.constraint(equalToConstant: Constants.bulbOffset)
        ]
        
        mainLabel.layoutIfNeeded()
        storedConstraints += [
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            mainLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0),
            mainLabel.rightAnchor.constraint(equalTo: rightContentView.leftAnchor),
        ]
        
        var previousLabel: UILabel?
        labels.enumerated().forEach { idx, label in
            label.layoutIfNeeded()
            if let previousLabel {
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: Constants.topAnchor),
                    label.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.titleLeftAnchor),
                    label.rightAnchor.constraint(equalTo: rightContentView.leftAnchor),
                ]
            } else {
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.topAnchor),
                    label.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.titleLeftAnchor),
                    label.rightAnchor.constraint(equalTo: rightContentView.leftAnchor),
                ]
            }
            previousLabel = label
        }
        
        storedConstraints += [
            isDoneImage.rightAnchor.constraint(equalTo: rightContentView.rightAnchor),
            isDoneImage.centerYAnchor.constraint(equalTo: rightContentView.centerYAnchor),
            isDoneImage.heightAnchor.constraint(equalToConstant: 21.0),
            isDoneImage.widthAnchor.constraint(equalTo: isDoneImage.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func updateContent() {
        mainLabel.text = configuration.title
        
        if configuration.isDone {
            isDoneImage.configuration = isDoneImage.configuration
                .with(firstImageConfig: .visible(image: .doneIcon, tintColor: .mysteryShack, aspectRatio: 1.0))
                .with(secondImageConfig: .visible(image: .circleDone, tintColor: .mysteryShack, aspectRatio: 1.0))
        } else {
            isDoneImage.configuration = isDoneImage.configuration
                .with(firstImageConfig: .visible(image: .doneIcon, tintColor: .mysteryShack, aspectRatio: 1.0))
                .with(secondImageConfig: .notVisible)
        }
        
        labels.forEach { label in
            if label.superview != nil {
                label.removeFromSuperview()
            }
        }
        
        labels.removeAll()
        
        configuration.translations.forEach { [weak self] text in
            guard let self else { return }
            let label = self.wordzExampleGen
            label.text = text
            self.labels.append(label)
            self.contentView.addSubview(label)
        }
    }
    
    public static func height(configuration: Configuration) -> CGFloat {
        var totalHeight: CGFloat = 0.0
        
        let mainLabelHeight = "MainTitleText".heightForOneLine( font: UIFont(name:"HelveticaNeue-Bold", size: 22.0))
        let secondLabelHeight = "SecondTitleText".heightForOneLine(font: UIFont(name:"HelveticaNeue", size: 16.0))
        
        totalHeight += 10.0
        totalHeight += mainLabelHeight
        
        if !configuration.translations.isEmpty {
            totalHeight +=  CGFloat(configuration.translations.count) * (secondLabelHeight + 10.0)
        }
        
        totalHeight += 15.0
        
        return totalHeight
    }
    
}
