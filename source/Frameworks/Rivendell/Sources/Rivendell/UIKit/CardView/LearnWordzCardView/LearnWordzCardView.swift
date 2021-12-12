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
        static var topMainContainerOffset: (Bool) -> CGFloat = { $0 ? 20.0 : 4.0 }
        static var mainBetweenLabelsOffset: CGFloat { 16.0 }
        static var labelBetweenOffset: CGFloat { 17.0 }
        static var top: CGFloat { 15.0 }
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
        label.numberOfLines = 2
        return label
    }()
    
    private var translationExampleGen: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 28.0)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }
    
    private lazy var translationExampleLabels: [UILabel] = {
        var translations: [UILabel] = []
        for _ in 1...3 {
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
    public init(
        swipeDirections: [BaseCardView.SwipeDirection] = [],
        configuration: Configuration = .init(wordz: "", translations: [])
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
        setupOnTap()
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
            switch (configuration.isExamples, configuration.isTranscription) {
            case (false, false):
                prepareSingleConstraintsToWordz()
            case (false, true):
                prepareMainTitleConstraints()
            default:
                prepareConstraintsToWordz()
            }
        /// Верстает экран к переводу с иностранного слова
        case .translation:
            prepareConstraintsToTranslation()
        }
        
        NSLayoutConstraint.activate(storedConstraints)
        
        updateVisabilityState()
    }
    
    private func updateWordzVisability() {
        wordzExampleLabels.forEach { label in
            label.layoutIfNeeded()
            exampleLabelContainer.layoutIfNeeded()
            let exampleLabelFrame = exampleLabelContainer.frame
            let labelFrame = label.frame
            let cardHeight = frame.height - 40.0
            let positionYLabel = exampleLabelFrame.minY
            + labelFrame.minY
            + labelFrame.height
            if cardHeight >= positionYLabel {
                label.alpha = 1.0
            } else {
                label.alpha = 0.0
            }
        }
    }
    
    private func updateTranslationVisability() {
        let countToHide = Array(zip(translationExampleLabels, configuration.translations)).count
        translationExampleLabels.enumerated().forEach { idx, label in
            if idx < countToHide {
                label.alpha = 1.0
            } else {
                label.alpha = 0.0
            }
        }
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
    
    private func prepareMainTitleConstraints() {
        storedConstraints += [
            mainLabelContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainLabelContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
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
        
        transcriptionLabel.layoutIfNeeded()
        storedConstraints += [
            transcriptionLabel.topAnchor.constraint(equalTo: wordzLabel.bottomAnchor, constant: Constants.mainBetweenLabelsOffset),
            transcriptionLabel.rightAnchor.constraint(equalTo: mainLabelContainer.rightAnchor),
            transcriptionLabel.leftAnchor.constraint(equalTo: mainLabelContainer.leftAnchor),
            transcriptionLabel.bottomAnchor.constraint(equalTo: mainLabelContainer.bottomAnchor),
        ]
        
        storedConstraints += [
            exampleLabelContainer.topAnchor.constraint(equalTo: mainLabelContainer.bottomAnchor, constant: Constants.topMainContainerOffset(configuration.isTranscription)),
            exampleLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            exampleLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ]
        
        wordzLabel.layoutIfNeeded()
        transcriptionLabel.layoutIfNeeded()
        wordzLabel.sizeToFit()
        transcriptionLabel.sizeToFit()
        
        var previousLabel: UILabel?
        
        wordzExampleLabels.forEach { label in
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
            previousLabel = label
            label.sizeToFit()
        }
    }
    
    private func prepareConstraintsToTranslation() {
        guard configuration.translations.count != 1 else {
            storedConstraints += [
                translationsLabelContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
                translationsLabelContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                translationsLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                translationsLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            ]
            
            let label = translationExampleLabels[0]
            
            label.numberOfLines = 6
            
            storedConstraints += [
                label.topAnchor.constraint(equalTo: translationsLabelContainer.topAnchor),
                label.rightAnchor.constraint(equalTo: translationsLabelContainer.rightAnchor),
                label.bottomAnchor.constraint(equalTo: translationsLabelContainer.bottomAnchor),
                label.leftAnchor.constraint(equalTo: translationsLabelContainer.leftAnchor),
            ]
            
            return
        }
        
        storedConstraints += [
            translationsLabelContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            translationsLabelContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            translationsLabelContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ]
        
        var previousLabel: UILabel?
        
        translationExampleLabels.enumerated().forEach { idx, label in
            if let previousLabel = previousLabel {
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: Constants.labelBetweenOffset),
                    label.rightAnchor.constraint(equalTo: translationsLabelContainer.rightAnchor),
                    label.leftAnchor.constraint(equalTo: translationsLabelContainer.leftAnchor),
                ]
            } else {
                label.numberOfLines = 3
                storedConstraints += [
                    label.topAnchor.constraint(equalTo: translationsLabelContainer.topAnchor),
                    label.rightAnchor.constraint(equalTo: translationsLabelContainer.rightAnchor),
                    label.leftAnchor.constraint(equalTo: translationsLabelContainer.leftAnchor),
                ]
            }
            if idx == (translationExampleLabels.count - 1) {
                storedConstraints += [
                    label.bottomAnchor.constraint(equalTo: translationsLabelContainer.bottomAnchor),
                ]
            }
            previousLabel = label
            label.sizeToFit()
        }
        
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
    // MARK: - Private methods
    
    func setupOnTap() {
        internalOnTap = { [weak self] in
            guard let self = self else { return }
            guard !self.configuration.translations.isEmpty else { return }
            let state: Configuration.State
            let options: UIView.AnimationOptions
            switch self.configuration.state {
            case .wordz:
                state = .translation
                options = [.transitionFlipFromRight]
            case .translation:
                state = .wordz
                options = [.transitionFlipFromLeft]
            }
            self.configuration = self.configuration
                .with(state: state)
            UIView.transition(
                with: self, duration: 0.3,
                options: options,
                animations: { [weak self] in
                    guard let self = self else { return }
                    self.updateVisabilityState()
                },
                completion: nil
            )
        }
    }
    
    private func updateSpacings() {
    }
    
    private func updateVisabilityState() {
        switch configuration.state {
        case .wordz:
            mainLabelContainer.alpha = 1.0
            exampleLabelContainer.alpha = configuration.isExamples ? 1.0 : 0.0
            translationsLabelContainer.alpha = 0.0
            updateWordzVisability()
        case .translation:
            mainLabelContainer.alpha = 0.0
            exampleLabelContainer.alpha = 0.0
            translationsLabelContainer.alpha = 1.0
            updateTranslationVisability()
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
