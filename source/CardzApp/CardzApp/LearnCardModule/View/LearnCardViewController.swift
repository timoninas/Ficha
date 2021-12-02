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
                                                        .with(imageMultiplier: 0.9))
    
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
    
    var cards = [
        LearnWordzCardView(swipeDirections: [.top, .right, .left, .bottom], configuration: .init(wordz: "beetle", translations: ["трамбовать", "дробить камни"])),
        LearnWordzCardView(swipeDirections: [.top, .right, .left, .bottom], configuration: .init(wordz: "dress", translations: ["платье", "одеваться"])),
        LearnWordzCardView(swipeDirections: [.top, .right, .left, .bottom], configuration: .init(wordz: "squirrel", translations: ["белка"]))
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
            starButton.bottomAnchor.constraint(equalTo: card.topAnchor, constant: -20.0)
        ])
        
    }

}

extension LearnCardViewController: LearnCardViewInput {
    
    func changeState() {
    }
    
}
