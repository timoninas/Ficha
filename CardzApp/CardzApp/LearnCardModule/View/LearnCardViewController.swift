//
//  LearnCardViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import UIKit
import Rivendell

public enum CardLearnModel {
    /// Simple mode. For exa, English -> Russian.
    case simpleMode
    /// Reverse mode. For exa, Russian -> English.
    case reverseMode
    /// Random mode. For exa, Russian/English -> English/Russian.
    case randomMode
}

final class LearnCardViewController: UIViewController {
    
    var output: LearnCardOutput?
    
    let mode: CardLearnModel
    
    private lazy var starButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "To\nfavorites", color: .olivie))
                                                        .with(align: .left)
                                                        .with(imageConfig: .visible(image: .starUnfilledIcon, color: .moonlight))
                                                        .with(imageMultiplier: 1.0)
                                                        .with(onTap: { [weak self] _ in
        guard let self else { return }
        if let card = self.cards.last {
            card.swipeTo(.top)
        } else {
            self.resultCard.swipeTo(.top)
        }
    }))
    
    private lazy var leftButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "I don't \nknow", color: .olivie))
                                                        .with(align: .top)
                                                        .with(imageConfig: .visible(image: .leftArrowIcon, color: .bloods))
                                                        .with(imageMultiplier: 1.0)
                                                        .with(onTap: { [weak self] _ in
        guard let self else { return }
        if let card = self.cards.last {
            card.swipeTo(.left)
        } else {
            self.resultCard.swipeTo(.left)
        }
    }))
    
    private lazy var rightButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "I know", color: .olivie))
                                                        .with(align: .top)
                                                        .with(imageConfig: .visible(image: .rightArrowIcon, color: .goblin))
                                                        .with(imageMultiplier: 1.0)
                                                        .with(onTap: { [weak self] _ in
        guard let self else { return }
        if let card = self.cards.last {
            card.swipeTo(.right)
        } else {
            self.resultCard.swipeTo(.right)
        }
    }))
    
    private lazy var closeButton = RVImageButton(configuration: .init()
                                                    .with(image: .closeIcon)
                                                    .with(backgroundColor: .clear)
                                                    .with(highlitedColor: .clear)
                                                    .with(imageColor: .nazgul)
                                                    .with(onTap: { [weak self] _ in
        guard let self else { return }
        UIApplication.hapticLight()
        self.dismiss(animated: true, completion: nil)
    }))
    
    private var allowedSwipeDirections: [BaseCardView.SwipeDirection] = [.top, .right, .left]
    
    private var viewModel: [LearnWordzCardView.ViewModel] = [] {
        didSet {
            renderCards()
            topCardSwiped(isNeedToRemoveCard: false)
        }
    }
    
    private var cards: [LearnWordzCardView] = [] {
        didSet {
            configureSwipeButtons()
            configureCenteringView()
        }
    }
    
    private var phantomCard = BaseCardView.phantomCard()
    
    private var resultCard = ResultLearnCardView(swipeDirections: [.top, .bottom, .left, .right], configuration: .init())
    
    private var swipeButtonContraints: [NSLayoutConstraint] = []
    private var centeringContraints: [NSLayoutConstraint] = []
    
    private let centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let leftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(output: LearnCardOutput, learnMode: CardLearnModel) {
        self.output = output
        self.mode = learnMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gendalf
        configureUI()
        output?.viewDidLoad()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
        RLogDebug(message: "viewDidAppear", subsystem: String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        addCloseButton()
        addPhantomCard()
        addResultCard()
        addCenteringViews()
        addSwipeButtons()
        
        view.bringSubviewToFront(resultCard)
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func addPhantomCard() {
        view.addSubview(phantomCard)
        phantomCard.renderAsCard(view: view)
    }
    
    private func changeVisabilityControls(isHidden: Bool, isAnimated: Bool) {
        let valueAlpha = isHidden ? 0.0 : 1.0
        if isAnimated {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self else { return }
                guard self.leftButton.alpha != valueAlpha else { return }
                self.leftButton.alpha = valueAlpha
                self.rightButton.alpha = valueAlpha
                self.starButton.alpha = valueAlpha
            }
        } else {
            guard leftButton.alpha != valueAlpha else { return }
            leftButton.alpha = valueAlpha
            rightButton.alpha = valueAlpha
            starButton.alpha = valueAlpha
        }
    }
    
    private func addResultCard() {
        resultCard.onEverySwipe { [weak self] in
            guard let self else { return }
            UIApplication.hapticLight()
            self.dismiss(animated: true, completion: nil)
        }
        
        resultCard.onCardChangedPosition = { [weak self] x, y in
            guard let self else { return }
            self.closeButton.isUserInteractionEnabled = false
            let hideTreasure = 65.0
            if abs(x) > hideTreasure || abs(y) > hideTreasure {
                self.changeVisabilityControls(isHidden: true, isAnimated: true)
            } else {
                self.changeVisabilityControls(isHidden: false, isAnimated: true)
            }
        }
        
        resultCard.onCardEndChangedPosition = { [weak self] in
            guard let self else { return }
            self.closeButton.isUserInteractionEnabled = true
        }
        
        resultCard.isUserInteractionEnabled = false
        resultCard.withCardShadow()
        
        view.addSubview(resultCard)
        NSLayoutConstraint.activate([
            resultCard.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
            resultCard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultCard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            resultCard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
        ])
    }
    
    private func renderCards() {
        cards.forEach { card in
            if card.superview != nil {
                card.removeFromSuperview()
            }
        }
        
        cards.removeAll()
        
        var tmpCards: [LearnWordzCardView] = []
        
        viewModel.enumerated().forEach { [weak self] (idx, model) in
            guard let self else { return }
            let state: LearnWordzCardView.Configuration.State
            switch self.mode {
            case .simpleMode:
                state = .wordz
            case .reverseMode:
                state = .translation
            case .randomMode:
                let num = Int.random(in: 0..<1488)
                if num % 2 == 0 {
                    state = .wordz
                } else {
                    state = .translation
                }
            }
            let card = LearnWordzCardView(
                swipeDirections: allowedSwipeDirections,
                configuration:
                        .init(wordz: model.wordz,
                              translations: model.translations)
                    .with(transcription: model.transcription)
                    .with(wordzExamples: model.wordzExamples)
                    .with(state: state)
            )
            
            card.onTopSwipe = { [weak self] in
                guard let self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.resultCard.configuration = self.resultCard.configuration
                    .with(favouritesCards: self.resultCard.configuration.favouritesCards + 1)
                self.output?.didSwipeCardTop(with: idx)
            }
            card.onLeftSwipe = { [weak self] in
                guard let self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.resultCard.configuration = self.resultCard.configuration
                    .with(dontKnowCards: self.resultCard.configuration.dontKnowCards + 1)
                self.output?.didSwipeCardLeft(with: idx)
            }
            card.onRightSwipe = { [weak self] in
                guard let self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.resultCard.configuration = self.resultCard.configuration
                    .with(knowCards: self.resultCard.configuration.knowCards + 1)
                self.output?.didSwipeCardRight(with: idx)
            }
            card.onDragCard = { [weak self] in
                guard let self else { return }
                self.output?.didDragCard(with: idx)
            }
            card.onCardChangedPosition = { [weak self] _, _ in
                guard let self else { return }
                self.closeButton.isUserInteractionEnabled = false
            }
            card.onCardEndChangedPosition = { [weak self] in
                guard let self else { return }
                self.closeButton.isUserInteractionEnabled = true
            }
            
            tmpCards.append(card)
            
            view.addSubview(card)
            card.renderAsCard(view: view)
            
            view.bringSubviewToFront(card)
        }
        
        cards = tmpCards
    }
    
    private func addCenteringViews() {
        view.addSubview(centerView)
        view.addSubview(leftView)
        view.addSubview(rightView)
    }
    
    private func configureCenteringView() {
        NSLayoutConstraint.deactivate(centeringContraints)
        centeringContraints.removeAll()
        
        centeringContraints += [
            centerView.widthAnchor.constraint(equalToConstant: 1.0),
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.topAnchor.constraint(equalTo: phantomCard.bottomAnchor),
            centerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            leftView.topAnchor.constraint(equalTo: centerView.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            leftView.leftAnchor.constraint(equalTo: view.leftAnchor),
            leftView.rightAnchor.constraint(equalTo: centerView.leftAnchor),
            
            rightView.topAnchor.constraint(equalTo: centerView.topAnchor),
            rightView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor),
            rightView.rightAnchor.constraint(equalTo: view.rightAnchor),
            rightView.leftAnchor.constraint(equalTo: centerView.rightAnchor),
        ]
        
        NSLayoutConstraint.activate(centeringContraints)
    }
    
    private func configureSwipeButtons() {
        NSLayoutConstraint.deactivate(swipeButtonContraints)
        swipeButtonContraints.removeAll()
        
        swipeButtonContraints += [
            leftButton.heightAnchor.constraint(equalToConstant: 105.0),
            leftButton.widthAnchor.constraint(equalToConstant: 65.0),
            leftButton.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            leftButton.topAnchor.constraint(equalTo: phantomCard.bottomAnchor, constant: 12.0)
        ]
        
        swipeButtonContraints += [
            rightButton.heightAnchor.constraint(equalToConstant: 105.0),
            rightButton.widthAnchor.constraint(equalToConstant: 65.0),
            rightButton.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            rightButton.topAnchor.constraint(equalTo: phantomCard.bottomAnchor, constant: 12.0)
        ]
        
        swipeButtonContraints += [
            starButton.heightAnchor.constraint(equalToConstant: 45.0),
            starButton.widthAnchor.constraint(equalToConstant: 135.0),
            starButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            starButton.bottomAnchor.constraint(equalTo: phantomCard.topAnchor, constant: -24.0)
        ]
        
        NSLayoutConstraint.activate(swipeButtonContraints)
    }
    
    private func addSwipeButtons() {
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(starButton)
    }
    
    private func topCardSwiped(isNeedToRemoveCard: Bool) {
        if isNeedToRemoveCard {
            cards.removeLast()
        }
        cards.forEach { card in
            card.isHidden = true
        }
        let last2Cards = Array(cards.suffix(2))
        if last2Cards.count == 2 {
            last2Cards[0].isUserInteractionEnabled = false
            last2Cards[0].isHidden = false
            last2Cards[1].isUserInteractionEnabled = true
            last2Cards[1].isHidden = false
        } else if last2Cards.count == 1 {
            last2Cards[0].isUserInteractionEnabled = true
            last2Cards[0].isHidden = false
        } else {
            resultCard.isUserInteractionEnabled = true
        }
    }
    
}

extension LearnCardViewController: LearnCardViewInput {
    
    func changeState(state: LearnCardViewState) {
        switch state {
        case .content(let viewModel):
            self.viewModel = viewModel
        case .error:
            break
        }
    }
    
}
