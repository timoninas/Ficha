//
//  WordzLearnCardView.swift
//  
//
//  Created by Антон Тимонин on 02.12.2021.
//

import UIKit

public class LearnWordzCardView: BaseCardView {
    
    // MARK: - Public properties
    
    /// Конфигурация элемента `LearnWordzCardView`.
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }
    
    // MARK: - Private properties
    
    private struct Constants {
        static var topContainerOffset: CGFloat { 45.0 }
        static var topMainContainerOffset: CGFloat { 30.0 }
        static var mainBetweenLabelsOffset: CGFloat { 16.0 }
        static var labelBetweenOffset: CGFloat { 15.0 }
    }
    
    private let mainLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let exampleLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let translationsLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wordzLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()
    
    private let transcriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue", size: 26.0)
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }()
    
    private var translationExampleGen: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }
    
    private lazy var translationExampleLabels: [UILabel] = {
        var translations: [UILabel] = []
        for _ in 1...5 {
            let label = translationExampleGen
            translations.append(label)
        }
        return translations
    }()
    
    private var wordzExampleGen: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue", size: 20.0)
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }
    
    private lazy var wordzExampleLabels: [UILabel] = {
        var examples: [UILabel] = []
        for _ in 1...3 {
            let label = wordzExampleGen
            examples.append(label)
        }
        return examples
    }()
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    /// Инициализирует элемент `LearnWordzCardView`.
    /// - Parameters:
    ///   - swipeDirections: Направление свайпов.
    ///   - configuration: Конфигруация элемента.
    public init(swipeDirections: [BaseCardView.SwipeDirection], configuration: Configuration) {
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
        addMainLabelContainer()
        addExampleLabelContainer()
        addTranslationsLabelContainer()
        addLabels()
        updateAppearance()
    }
    
    private func addMainLabelContainer() {
        addSubview(mainLabelContainer)
    }
    
    private func addExampleLabelContainer() {
        addSubview(exampleLabelContainer)
    }
    
    private func addTranslationsLabelContainer() {
        addSubview(translationsLabelContainer)
    }
    
    private func addLabels() {
        
        mainLabelContainer.addSubview(wordzLabel)
        mainLabelContainer.addSubview(transcriptionLabel)
        
        wordzExampleLabels.forEach { [weak self] label in
            guard let self = self else { return }
            self.exampleLabelContainer.addSubview(label)
        }
        
        translationExampleLabels.forEach { [weak self] label in
            guard let self = self else { return }
            self.translationsLabelContainer.addSubview(label)
        }
        
    }
    
    private func updateAppearance() {
        updateData()
        updateSpacings()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        switch configuration.state {
            
        /// Верстает экран к иностранному варианту.
        case .wordz:
            if !configuration.isExamples && !configuration.isTranscription {
                prepareSingleConstraintsToWordz()
            } else {
                prepareConstraintsToWordz()
            }
            
            
        /// Верстает экран к переводу с иностранного слова
        case .translation:
            prepareConstraintsToTranslation()
        }
        
        NSLayoutConstraint.activate(storedConstraints)
        
        /// Обновляем видимость карточки в соответсии с состоянием.
        updateVisabilityState()
    }
    
    private func prepareSingleConstraintsToWordz() {
        storedConstraints += [
            mainLabelContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainLabelContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        wordzLabel.layoutIfNeeded()
        storedConstraints += [
            wordzLabel.centerXAnchor.constraint(equalTo: mainLabelContainer.centerXAnchor),
            wordzLabel.centerYAnchor.constraint(equalTo: mainLabelContainer.centerYAnchor),
            wordzLabel.rightAnchor.constraint(equalTo: mainLabelContainer.rightAnchor),
            wordzLabel.leftAnchor.constraint(equalTo: mainLabelContainer.leftAnchor),
        ]
        wordzLabel.sizeToFit()
    }
    
    private func prepareConstraintsToWordz() {
        storedConstraints += [
            mainLabelContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topContainerOffset),
            mainLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ]
        
        wordzLabel.layoutIfNeeded()
        storedConstraints += [
            wordzLabel.topAnchor.constraint(equalTo: mainLabelContainer.topAnchor),
            wordzLabel.rightAnchor.constraint(equalTo: mainLabelContainer.rightAnchor),
            wordzLabel.leftAnchor.constraint(equalTo: mainLabelContainer.leftAnchor),
        ]
        wordzLabel.sizeToFit()
        
        transcriptionLabel.layoutIfNeeded()
        storedConstraints += [
            transcriptionLabel.topAnchor.constraint(equalTo: wordzLabel.bottomAnchor, constant: Constants.mainBetweenLabelsOffset),
            transcriptionLabel.rightAnchor.constraint(equalTo: mainLabelContainer.rightAnchor),
            transcriptionLabel.leftAnchor.constraint(equalTo: mainLabelContainer.leftAnchor),
            transcriptionLabel.bottomAnchor.constraint(equalTo: mainLabelContainer.bottomAnchor),
        ]
        transcriptionLabel.sizeToFit()
        
        storedConstraints += [
            exampleLabelContainer.topAnchor.constraint(equalTo: mainLabelContainer.bottomAnchor, constant: Constants.topMainContainerOffset),
            exampleLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            exampleLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            exampleLabelContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        var verstedLabels: [UILabel] = []
        
        var previousLabel: UILabel?
        
        wordzExampleLabels.forEach { label in
            let estimatedHeight: CGFloat = Constants.topContainerOffset
            + mainLabelContainer.frame.height
            + Constants.topMainContainerOffset
            + Constants.mainBetweenLabelsOffset
            + verstedLabels.map { label in label.expectedHeight }.reduce(0.0, +)
            let contentViewHeight = contentView.frame.height
            if let previousLabel = previousLabel {
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: Constants.labelBetweenOffset),
                    label.rightAnchor.constraint(equalTo: exampleLabelContainer.rightAnchor),
                    label.leftAnchor.constraint(equalTo: exampleLabelContainer.leftAnchor),
                ]
            } else {
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: exampleLabelContainer.topAnchor),
                    label.rightAnchor.constraint(equalTo: exampleLabelContainer.rightAnchor),
                    label.leftAnchor.constraint(equalTo: exampleLabelContainer.leftAnchor),
                ]
            }
            label.sizeToFit()
            if label.expectedHeight < contentViewHeight - estimatedHeight {
                verstedLabels.append(label)
                previousLabel = label
            }
            label.alpha = 0.0
        }
        verstedLabels.forEach { label in
            label.alpha = 1.0
        }
    }
    
    private func prepareConstraintsToTranslation() {
        
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
    // MARK: - Private methods
    
    private func updateSpacings() {
    }
    
    private func updateVisabilityState() {
        switch configuration.state {
        case .wordz:
            mainLabelContainer.isHidden = false
            exampleLabelContainer.isHidden = configuration.isExamples ? false : true
            translationsLabelContainer.isHidden = true
        case .translation:
            mainLabelContainer.isHidden = true
            exampleLabelContainer.isHidden = true
            translationsLabelContainer.isHidden = false
        }
    }
    
    private func updateData() {
        wordzLabel.text = configuration.wordz
        transcriptionLabel.text = configuration.transcription
        for (label, item) in zip(translationExampleLabels, configuration.translations) {
            label.text = item
        }
        for (label, item) in zip(wordzExampleLabels, configuration.wordzExamples) {
            label.text = item
        }
    }
    
}
