//
//  OnboardingUserViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import UIKit
import Rivendell

final class OnboardingUserViewController: UIViewController {
    
    var output: OnboardingUserViewOutput?
    
    private var viewModel: ViewModel = .init(cards: []) {
        didSet {
            guard viewModel != oldValue else { return }
            renderViewModelCards()
        }
    }
    
    private var cards: [OnboardingCardView] = []
    
    private var phantomCard = BaseCardView.phantomCard()
    
    private lazy var closeButton = RVImageButton(configuration: .init()
                                                    .with(image: .closeIcon)
                                                    .with(backgroundColor: .clear)
                                                    .with(highlitedColor: .clear)
                                                    .with(imageColor: .nazgul)
                                                    .with(onTap: { [weak self] _ in
        guard let self = self else { return }
        UIApplication.hapticLight()
        self.dismiss(animated: true, completion: nil)
    }))
    
    init(output: OnboardingUserViewOutput) {
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
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func addPhantomCard() {
        view.addSubview(phantomCard)
        phantomCard.renderAsCard(view: view)
    }
    
    private func renderViewModelCards() {
        viewModel.cards.enumerated().forEach { idx, model in
            let card = OnboardingCardView(
                swipeDirections: [.top, .bottom, .left, .right],
                configuration: .init()
                    .with(image: model.image)
                    .with(title: model.title)
            )
            
            cards.append(card)
            view.addSubview(card)
            card.renderAsCard(view: view)
            
            card.onEverySwipe { [weak self] in
                guard let self = self else { return }
                self.cardSwiped(with: idx)
            }
        }
    }
    
    private func cardSwiped(with index: Int) {
        cards.removeLast()
        if cards.isEmpty {
            UIApplication.hapticSoft()
            dismiss(animated: true, completion: nil)
        }
    }
    
}

extension OnboardingUserViewController: OnboardingUserViewInput {
    
    func changeState(state: SimpleScreenState<ViewModel>) {
        switch state {
        case .normal(model: let model):
            viewModel = model
        case .error:
            break
        }
    }
    
}
