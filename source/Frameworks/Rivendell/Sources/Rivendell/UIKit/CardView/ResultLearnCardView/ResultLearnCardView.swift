//
//  ResultLearnCardView.swift
//  
//
//  Created by Антон Тимонин on 13.12.2021.
//

import UIKit

public class ResultLearnCardView: BaseCardView {
    
    // MARK: - Public properties
    
    /// Конфигурация элемента `LearnWordzCardView`.
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }
    
    // MARK: - Private properties
    
    private struct Constants {
    }
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 34.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private var labelGen: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    private lazy var knowLabel: UILabel = {
        let label = labelGen
        return label
    }()
    
    private lazy var dontKnowLabel: UILabel = {
        let label = labelGen
        return label
    }()
    
    private lazy var favouriteLabel: UILabel = {
        let label = labelGen
        return label
    }()
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    /// Инициализирует элемент `ResultLearnCardView`.
    /// - Parameters:
    ///   - swipeDirections: Направление свайпов.
    ///   - configuration: Конфигруация элемента.
    public init(
        swipeDirections: [BaseCardView.SwipeDirection] = [],
        configuration: Configuration = .init()
    ) {
        self.configuration = configuration
        super.init(swipeDirections: swipeDirections)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func configureUI() {
        updateAppearance()
    }
    
    private func updateAppearance() {
        updateData()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func updateData() {
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
}

