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
    
    private let flippedImage: UIImageView = {
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
        addFlippedImage()
        setupOnTap()
        updateAppearance()
    }
    
    private func updateAppearance() {
        updateData()
        setupConstraints()
        updateVisability()
    }
    
    private func addOnboardingImage() {
        contentView.addSubview(onboardingImage)
    }
    
    private func addTitle() {
        contentView.addSubview(titleLabel)
    }
    
    private func addFlippedImage() {
        contentView.addSubview(flippedImage)
    }
    
    private func updateData() {
        titleLabel.text = configuration.title
        onboardingImage.image = configuration.image
        flippedImage.image = configuration.flippedImage
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
        
        storedConstraints += [
            flippedImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            flippedImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            flippedImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            flippedImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    // MARK: - Private methods
    
    func setupOnTap() {
        internalOnTap = { [weak self] in
            guard let self else { return }
            guard self.configuration.flippedImage != nil else { return }
            let options: UIView.AnimationOptions
            
            switch self.configuration.state {
            case .fliped:
                self.configuration = self.configuration
                    .with(state: .normal)
                options = [.transitionFlipFromRight]
            case .normal:
                self.configuration = self.configuration
                    .with(state: .fliped)
                options = [.transitionFlipFromLeft]
            }
            UIView.transition(
                with: self, duration: 0.3,
                options: options,
                animations: { },
                completion: nil
            )
        }
    }
    
    private func updateVisability() {
        switch configuration.state {
        case .normal:
            titleLabel.isHidden = false
            onboardingImage.isHidden = false
            flippedImage.isHidden = true
        case .fliped:
            titleLabel.isHidden = true
            onboardingImage.isHidden = true
            flippedImage.isHidden = false
        }
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
}
