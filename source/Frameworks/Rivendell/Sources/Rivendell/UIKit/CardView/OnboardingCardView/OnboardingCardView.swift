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
//        iv.image = .kolokol?.withRenderingMode(.alwaysTemplate)
//        iv.tintColor = .mysteryShack
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .center
        label.numberOfLines = 4
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
        
    }
    
    private func addTitle() {
        
    }
    
    private func updateData() {
        titleLabel.text = configuration.title
        onboardingImage.image = configuration.image
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateData()
        setupConstraints()
    }
    
}

