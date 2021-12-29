//
//  OnboardingCardView.swift
//  
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit

public class OnboardingCardView: BaseCardView {
    
    private let onboardingImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }
    
    public init(swipeDirections: [BaseCardView.SwipeDirection] = [], configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(swipeDirections: swipeDirections)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addOnboardingImage()
        addTitle()
        updateData()
        setupConstraints()
    }
    
    private func addOnboardingImage() {
        contentView.addSubview(onboardingImage)
    }
    
    private func addTitle() {
        contentView.addSubview(titleLabel)
    }
    
    private func updateData() {
        titleLabel.text = configuration.title
        onboardingImage.image = configuration.image
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            onboardingImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            onboardingImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            onboardingImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ]
        
        if self.configuration.title.isEmpty {
            storedConstraints += [
                onboardingImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ]
        } else {
            storedConstraints += [
                onboardingImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
            ]
            
            storedConstraints += [
                titleLabel.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 12.0),
                titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0),
            ]
        }
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateData()
        setupConstraints()
    }
    
}

