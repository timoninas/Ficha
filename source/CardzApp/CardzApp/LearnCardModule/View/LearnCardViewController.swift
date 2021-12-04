//
//  LearnCardViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import UIKit
import Rivendell

final class LearnCardViewController: UIViewController {
    
    weak var output: LearnCardOutput?
    
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
    
    lazy var cards = [
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "beetle", translations: ["Трамбовать", "Дробить камни"])
                            .with(transcription: "[biːtl]")
                            .with(wordzExamples: ["The petrified impression was about three inches long and looked to be the underside of some kind of huge beetle or crawling insect", "Our friend, the click beetle"])),
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "To get those subjects", translations: ["Чтобы получить эти предметы"])
                            .with(wordzExamples: ["There's no use getting on to that subject"])),
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "Dress", translations: ["Платье", "Одеваться"])
                            .with(wordzExamples: ["A thin black woman was seated in a chair in a corner of the room sewing on a dress", "The little girl watched me, holding the bread against her dirty dress", "She never conformed in dress or conduct"])),
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "Blow someone's head off", translations: ["Cнести голову кому-то"])),
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "Blow someone's head off", translations: ["Cнести голову кому-то"])
                            .with(wordzExamples: ["How do you go from eight years of a happy marriage to wanting to blow someone's head off?"])),
        LearnWordzCardView(swipeDirections: allowedSwipeDirections, configuration: .init(wordz: "Squirrel", translations: ["Белка"])
                            .with(transcription: "[ˈskwɪrəl]")
                            .with(wordzExamples: ["A squirrel probably got into the attic", "One day a neighbouring cat came to see her, and the squirrel was clearly the subject of their talk", "squirrel food"])),
    ]
    
    let centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let leftView: UIView = {
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        addCardsView()
        addCenteringViews()
        addSwipeButtons()
        for card in cards {
            view.bringSubviewToFront(card)
        }
        
    }
    
    private func addCardsView() {
        cards.forEach { [weak self] card in
            guard let self = self else { return }
            card.onTopSwipe = { print("Top swipe") }
            card.onLeftSwipe = { print("Left swipe") }
            card.onRightSwipe = { print("Right swipe") }
            card.onBottomSwipe = { print("Bottom swipe") }
            card.onDragCard = { print("Drag swipe") }
            
            self.view.addSubview(card)
            NSLayoutConstraint.activate([
                card.heightAnchor.constraint(equalToConstant: self.view.safeAreaHeight / 1.75),
                card.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                card.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0),
                card.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0),
            ])
        }
    }
    
    private func addCenteringViews() {
        guard let card = cards.first else { return }
        view.addSubview(centerView)
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        NSLayoutConstraint.activate([
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
        ])
    }
    
    private func addSwipeButtons() {
        guard let card = cards.first else { return }
        
        view.addSubview(leftButton)
        
        NSLayoutConstraint.activate([
            leftButton.heightAnchor.constraint(equalToConstant: 105.0),
            leftButton.widthAnchor.constraint(equalToConstant: 65.0),
            leftButton.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            leftButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 12.0)
        ])
        
        view.addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            rightButton.heightAnchor.constraint(equalToConstant: 105.0),
            rightButton.widthAnchor.constraint(equalToConstant: 65.0),
            rightButton.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            rightButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 12.0)
        ])
        
        view.addSubview(starButton)
        
        NSLayoutConstraint.activate([
            starButton.heightAnchor.constraint(equalToConstant: 45.0),
            starButton.widthAnchor.constraint(equalToConstant: 135.0),
            starButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            starButton.bottomAnchor.constraint(equalTo: card.topAnchor, constant: -24.0)
        ])
        
    }
    
}

extension LearnCardViewController: LearnCardViewInput {
    
    func changeState() {
    }
    
}
