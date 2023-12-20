//
//  MergerImagerView.swift
//  
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit

public final class MergerImagerView: UIView {
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(old: oldValue)
        }
    }
    
    private var firstImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var secondImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSecondImageView()
        addFirstImageView()
        
        updateAppearance()
        setupConstraints()
    }
    
    private func addFirstImageView() {
        addSubview(firstImageView)
    }
    
    private func addSecondImageView() {
        addSubview(secondImageView)
    }
    
    private func updateAppearance() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        switch configuration.firstImageConfig {
        case .visible(image: let image, tintColor: let tintColor, aspectRatio: let ratio):
            firstImageView.image = image?.withRenderingMode(.alwaysTemplate)
            firstImageView.tintColor = tintColor
            firstImageView.isHidden = false
            storedConstraints.append(firstImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ratio))
        case .notVisible:
            firstImageView.isHidden = true
        }
        
        switch configuration.secondImageConfig {
        case .visible(image: let image, tintColor: let tintColor, aspectRatio: let ratio):
            secondImageView.image = image?.withRenderingMode(.alwaysTemplate)
            secondImageView.tintColor = tintColor
            secondImageView.isHidden = false
            storedConstraints.append(secondImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ratio))
        case .notVisible:
            secondImageView.isHidden = true
        }
        
        storedConstraints += [
            firstImageView.widthAnchor.constraint(equalTo: firstImageView.heightAnchor),
            firstImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            secondImageView.widthAnchor.constraint(equalTo: secondImageView.heightAnchor),
            secondImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func configurationChanged(old: Configuration) {
        updateAppearance()
    }
    
}
