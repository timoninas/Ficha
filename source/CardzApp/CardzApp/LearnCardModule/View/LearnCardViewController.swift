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
    
    var cardView = BaseCardView(swipeDirections: .top, .right, .left, .bottom, .bottom)
    
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
    
    private func configureUI() {
        self.addCardView()
    }
    
    private func addCardView() {
        cardView.onTopSwipe = { print("Top swipe") }
        cardView.onLeftSwipe = { print("Left swipe") }
        cardView.onRightSwipe = { print("Right swipe") }
        cardView.onBottomSwipe = { print("Bottom swipe") }
        cardView.onDragCard = { print("Drag swipe") }
        
        self.view.addSubview(self.cardView)
        NSLayoutConstraint.activate([
            self.cardView.heightAnchor.constraint(equalToConstant: self.view.safeAreaHeight / 1.75),
            self.cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.cardView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0),
            self.cardView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0),
        ])
        
    }

}

extension LearnCardViewController: LearnCardViewInput {
    
    func changeState() {
    }
    
}
