//
//  LearnCardViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import UIKit
import Rivendell

final class LearnCardViewController: UIViewController {
    
    var output: LearnCardOutput?
    
    private lazy var starButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "To\nfavorites", color: .olivie))
                                                        .with(align: .left)
                                                        .with(imageConfig: .visible(image: .starUnfilledIcon, color: .moonlight))
                                                        .with(imageMultiplier: 1.0))
    
    private lazy var leftButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "I don't \nknow", color: .olivie))
                                                        .with(align: .top)
                                                        .with(imageConfig: .visible(image: .leftArrowIcon, color: .bloods))
                                                        .with(imageMultiplier: 1.0))
    
    private lazy var rightButton = RVAlignImageButton(configuration: .init()
                                                        .with(titleConfig: .visible(title: "I know", color: .olivie))
                                                        .with(align: .top)
                                                        .with(imageConfig: .visible(image: .rightArrowIcon, color: .goblin))
                                                        .with(imageMultiplier: 1.0))
    
    private lazy var closeButton = RVImageButton(configuration: .init()
                                                    .with(image: .closeIcon)
                                                    .with(backgroundColor: .clear)
                                                    .with(highlitedColor: .clear)
                                                    .with(imageColor: .nazgul)
                                                    .with(onTap: { [weak self] _ in
        guard let self = self else { return }
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
            guard !cards.isEmpty else { return }
            configureSwipeButtons()
            configureCenteringView()
        }
    }
    
    private var phantomCard = LearnWordzCardView(configuration: .init(wordz: "", translations: []))
    
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
    
    init(output: LearnCardOutput) {
        self.output = output
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        addCloseButton()
        addPhantomCard()
        addCenteringViews()
        addSwipeButtons()
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            closeButton.heightAnchor.constraint(equalToConstant: 30.0),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
    }
    
    private func addPhantomCard() {
        phantomCard.alpha = 0.0
        phantomCard.isUserInteractionEnabled = false
        view.addSubview(phantomCard)
        NSLayoutConstraint.activate([
            phantomCard.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
            phantomCard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            phantomCard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            phantomCard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
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
            guard let self = self else { return }
            let card = LearnWordzCardView(
                swipeDirections: allowedSwipeDirections,
                configuration:
                        .init(wordz: model.wordz,
                              translations: model.translations)
                    .with(transcription: model.transcription)
                    .with(wordzExamples: model.wordzExamples)
            )
            
            card.onTopSwipe = { [weak self] in
                guard let self = self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.output?.didSwipeCardTop(with: idx)
            }
            card.onLeftSwipe = { [weak self] in
                guard let self = self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.output?.didSwipeCardLeft(with: idx)
            }
            card.onRightSwipe = { [weak self] in
                guard let self = self else { return }
                self.topCardSwiped(isNeedToRemoveCard: true)
                self.output?.didSwipeCardRight(with: idx)
            }
            card.onDragCard = { [weak self] in
                guard let self = self else { return }
                self.output?.didDragCard(with: idx)
            }
            card.onCardChangedPosition = { [weak self] _, _ in
                guard let self = self else { return }
                self.closeButton.isUserInteractionEnabled = false
            }
            card.onCardEndChangedPosition = { [weak self] in
                guard let self = self else { return }
                self.closeButton.isUserInteractionEnabled = true
            }
            
            tmpCards.append(card)
            
            view.addSubview(card)
            NSLayoutConstraint.activate([
                card.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
                card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                card.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
                card.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            ])
            
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
