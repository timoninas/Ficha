//
//  WordzLearnCardView.swift
//  
//
//  Created by Антон Тимонин on 02.12.2021.
//

import UIKit

public class LearnWordzCardView: BaseCardView {
    
    private let labelContainer: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }

    public init(swipeDirections: [BaseCardView.SwipeDirection], configuration: Configuration) {
        self.configuration = configuration
        super.init(swipeDirections: swipeDirections)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addLabelContainer()
        updateData()
        setupConstraints()
    }
    
    private func addLabelContainer() {
        contentView.addSubview(labelContainer)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        let bottomAnchor = labelContainer.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -37.0)
        bottomAnchor.priority = .defaultLow
        
        let centerAnchor = labelContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        centerAnchor.priority = .required
        
        storedConstraints += [
            bottomAnchor,
            centerAnchor,
            labelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5.0),
            labelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0),
            
        ]
        
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
    }
    
}
