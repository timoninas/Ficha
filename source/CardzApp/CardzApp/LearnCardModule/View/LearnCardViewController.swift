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
    
    private var allowedSwipeDirections: [BaseCardView.SwipeDirection] = [.top, .right, .left]
    
    private var viewModel: [LearnWordzCardView.ViewModel] = [] {
        didSet {
            renderCards()
        }
    }
    
    private var cards: [LearnWordzCardView] = [] {
        didSet {
            guard !cards.isEmpty else { return }
            configureSwipeButtons()
            configureCenteringView()
        }
    }
    
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
        self.view.backgroundColor = .gendalf
        self.configureUI()
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
        addCenteringViews()
        addSwipeButtons()
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
                self.output?.didSwipeCardTop(with: idx)
            }
            card.onLeftSwipe = { [weak self] in
                guard let self = self else { return }
                self.output?.didSwipeCardLeft(with: idx)
            }
            card.onRightSwipe = { [weak self] in
                guard let self = self else { return }
                self.output?.didSwipeCardRight(with: idx)
            }
            card.onDragCard = { print("Drag swipe") }
            
            tmpCards.append(card)
            
            self.view.addSubview(card)
            NSLayoutConstraint.activate([
                card.heightAnchor.constraint(equalToConstant: self.view.safeAreaHeight / 1.75),
                card.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                card.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0),
                card.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0),
            ])
            
            
            view.bringSubviewToFront(card)
        }
        
        self.cards = tmpCards
    }
    
    private func addCenteringViews() {
        view.addSubview(centerView)
        view.addSubview(leftView)
        view.addSubview(rightView)
    }
    
    private func configureCenteringView() {
        guard let card = cards.first else { return }
        
        NSLayoutConstraint.deactivate(centeringContraints)
        centeringContraints.removeAll()
        
        centeringContraints += [
            centerView.widthAnchor.constraint(equalToConstant: 1.0),
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.topAnchor.constraint(equalTo: card.bottomAnchor),
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
        guard let card = cards.first else { return }
        
        NSLayoutConstraint.deactivate(swipeButtonContraints)
        swipeButtonContraints.removeAll()
        
        swipeButtonContraints += [
            leftButton.heightAnchor.constraint(equalToConstant: 105.0),
            leftButton.widthAnchor.constraint(equalToConstant: 65.0),
            leftButton.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            leftButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 12.0)
        ]
        
        swipeButtonContraints += [
            rightButton.heightAnchor.constraint(equalToConstant: 105.0),
            rightButton.widthAnchor.constraint(equalToConstant: 65.0),
            rightButton.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            rightButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 12.0)
        ]
        
        swipeButtonContraints += [
            starButton.heightAnchor.constraint(equalToConstant: 45.0),
            starButton.widthAnchor.constraint(equalToConstant: 135.0),
            starButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            starButton.bottomAnchor.constraint(equalTo: card.topAnchor, constant: -24.0)
        ]
        
        NSLayoutConstraint.activate(swipeButtonContraints)
    }
    
    private func addSwipeButtons() {
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(starButton)
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
