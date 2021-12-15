//
//  AlertCardView.swift
//  
//
//  Created by Антон Тимонин on 14.11.2021.
//

import UIKit

public class AlertCardView: BaseCardView {
    
    private let alertImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = .kolokol?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .mysteryShack
        return iv
    }()
    
    private let labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue", size: 18.0)
        label.textAlignment = .center
        label.numberOfLines = 8
        return label
    }()
    
    private var secondIsEmpty: Bool {
        guard let text = secondTitleLabel.text else { return true }
        return text.isEmpty
    }
    
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
        addKolokolImage()
        addLabelContainer()
        addTitleLabel()
        addSecondTitleLabel()
        updateData()
        setupConstraints()
    }
    
    private func addKolokolImage() {
        contentView.addSubview(alertImage)
    }
    
    private func addLabelContainer() {
        contentView.addSubview(labelContainer)
    }
    
    private func addTitleLabel() {
        labelContainer.addSubview(titleLabel)
    }
    
    private func addSecondTitleLabel() {
        labelContainer.addSubview(secondTitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            alertImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            alertImage.heightAnchor.constraint(equalToConstant: 32.0),
            alertImage.widthAnchor.constraint(equalTo: alertImage.heightAnchor),
            alertImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        
        let topAnchor = labelContainer.topAnchor.constraint(lessThanOrEqualTo: alertImage.bottomAnchor, constant: 5.0)
        topAnchor.priority = .defaultLow
        
        let bottomAnchor = labelContainer.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -37.0)
        bottomAnchor.priority = .defaultLow
        
        let centerAnchor = labelContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        centerAnchor.priority = .required
        
        storedConstraints += [
            topAnchor,
            bottomAnchor,
            centerAnchor,
            labelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5.0),
            labelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0),
            
        ]
        storedConstraints += [
            titleLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: labelContainer.rightAnchor),
            titleLabel.leftAnchor.constraint(equalTo: labelContainer.leftAnchor)
        ]
        titleLabel.sizeToFit()
        
        storedConstraints += [
            secondTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            secondTitleLabel.rightAnchor.constraint(equalTo: labelContainer.rightAnchor),
            secondTitleLabel.leftAnchor.constraint(equalTo: labelContainer.leftAnchor),
            secondTitleLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor)
        ]
        secondTitleLabel.sizeToFit()
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateData()
        updateSpacings()
        setupConstraints()
    }
    
    private func updateSpacings() {
    }
    
    private func updateData() {
        titleLabel.text = configuration.title
        secondTitleLabel.text = configuration.secondTitle
    }
    
}
