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
        static var resultText: String { "Result" }
        static var imageSize: CGFloat { 56.0 }
        static var imageOffset: CGFloat { 12.0 }
        static var spacingBetweenBlocks: CGFloat { 20.0 }
    }
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = Constants.resultText
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
    
    private lazy var knowImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .rightArrowIcon?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .goblin
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var dontKnowImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .leftArrowIcon?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .bloods
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var favouriteImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .starUnfilledIcon?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .moonlight
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
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
        addResultLabel()
        addImageViews()
        addLabelViews()
        updateAppearance()
        setupConstraints()
    }
    
    private func addResultLabel() {
        contentView.addSubview(resultLabel)
    }
    
    private func addImageViews() {
        contentView.addSubview(knowImageView)
        contentView.addSubview(dontKnowImageView)
        contentView.addSubview(favouriteImageView)
    }
    
    private func addLabelViews() {
        contentView.addSubview(knowLabel)
        contentView.addSubview(dontKnowLabel)
        contentView.addSubview(favouriteLabel)
    }
    
    private func updateAppearance() {
        updateData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            resultLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            resultLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0),
            resultLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4.0),
            resultLabel.heightAnchor.constraint(equalToConstant: resultLabel.heightForOneLine())
        ]
        
        // Know block
        
        storedConstraints += [
            knowImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -Constants.imageSize - Constants.imageOffset),
            knowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            knowImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            knowImageView.widthAnchor.constraint(equalTo: knowImageView.heightAnchor),
        ]
        
        storedConstraints += [
            knowLabel.leftAnchor.constraint(equalTo: knowImageView.rightAnchor, constant: 20.0),
            knowLabel.heightAnchor.constraint(equalToConstant: dontKnowLabel.heightForOneLine()),
            knowLabel.centerYAnchor.constraint(equalTo: knowImageView.centerYAnchor),
            knowLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ]
        
        // Dont know block
        
        storedConstraints += [
            dontKnowImageView.centerXAnchor.constraint(equalTo: knowImageView.centerXAnchor),
            dontKnowImageView.topAnchor.constraint(equalTo: knowImageView.bottomAnchor, constant: Constants.spacingBetweenBlocks - 8),
            dontKnowImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            dontKnowImageView.widthAnchor.constraint(equalTo: dontKnowImageView.heightAnchor),
        ]
        
        storedConstraints += [
            dontKnowLabel.leftAnchor.constraint(equalTo: knowLabel.leftAnchor),
            dontKnowLabel.heightAnchor.constraint(equalToConstant: dontKnowLabel.heightForOneLine()),
            dontKnowLabel.centerYAnchor.constraint(equalTo: dontKnowImageView.centerYAnchor),
            dontKnowLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ]
        
        // Favourite block
        
        let favouriteSize: CGFloat = Constants.imageSize * 0.75
        
        storedConstraints += [
            favouriteImageView.centerXAnchor.constraint(equalTo: dontKnowImageView.centerXAnchor),
            favouriteImageView.bottomAnchor.constraint(equalTo: knowImageView.topAnchor, constant: -Constants.spacingBetweenBlocks),
            favouriteImageView.heightAnchor.constraint(equalToConstant: favouriteSize),
            favouriteImageView.widthAnchor.constraint(equalTo: favouriteImageView.heightAnchor),
        ]
        
        storedConstraints += [
            favouriteLabel.leftAnchor.constraint(equalTo: dontKnowLabel.leftAnchor),
            favouriteLabel.heightAnchor.constraint(equalToConstant: favouriteLabel.heightForOneLine()),
            favouriteLabel.centerYAnchor.constraint(equalTo: favouriteImageView.centerYAnchor),
            favouriteLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ]
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func updateData() {
        UIView.transition(with: self.knowLabel, duration: 0.1, options: .transitionCrossDissolve) { [weak self] in
            guard let self else { return }
            self.knowLabel.text = "\(self.configuration.knowCards) cards"
        }
        
        UIView.transition(with: self.dontKnowLabel, duration: 0.1, options: .transitionCrossDissolve) { [weak self] in
            guard let self else { return }
            self.dontKnowLabel.text = "\(self.configuration.dontKnowCards) cards"
        }
        
        UIView.transition(with: self.favouriteLabel, duration: 0.1, options: .transitionCrossDissolve) { [weak self] in
            guard let self else { return }
            self.favouriteLabel.text = "\(self.configuration.favouritesCards) cards"
        }
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
}
