//
//  OnboardingUserViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import Rivendell
import SwiftUI
import UIKit

struct OnboardingUserView: UIViewControllerRepresentable {
    typealias UIViewControllerType = OnboardingUserViewController
    
    private var model: OnboardingModuleModel
    
    init(model: OnboardingModuleModel) {
        self.model = model
    }
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        OnboardingUserBuilder.build(model: self.model)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}

final class OnboardingUserViewController: UIViewController {
    
    var output: OnboardingUserViewOutput?
    
    private var viewModel: ViewModel = .init(cards: []) {
        didSet {
            guard viewModel != oldValue else { return }
            renderViewModelCards()
            cardSwiped(isNeedToRemove: false)
        }
    }
    
    private var cards: [OnboardingCardView] = []
    
    private var phantomCard = BaseCardView.phantomCard()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Onboarding"
        return label
    }()
    
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
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
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
        addTitleLabel()
        addPhantomCard()
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.sizeToFit()
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            titleLabel.rightAnchor.constraint(lessThanOrEqualTo: closeButton.leftAnchor, constant: -20.0)
        ])
    }
    
    private func addPhantomCard() {
        view.addSubview(phantomCard)
        phantomCard.renderAsCard(view: view)
    }
    
    private func renderViewModelCards() {
        viewModel.cards.enumerated().forEach { [weak self] idx, model in
            guard let self else { return }
            let card = OnboardingCardView(
                swipeDirections: [.top, .bottom, .left, .right],
                configuration: .init()
                    .with(image: model.image)
                    .with(title: model.title)
                    .with(flippedImage: model.flippedImage)
            )
            
            cards.append(card)
            view.addSubview(card)
            card.renderAsCard(view: view)
            
            card.onEverySwipe { [weak self] in
                guard let self else { return }
                self.cardSwiped(isNeedToRemove: true)
            }
            
            if idx == (viewModel.cards.count - 1) {
                card.withCardShadow()
            }
        }
    }
    
    private func cardSwiped(isNeedToRemove: Bool) {
        if isNeedToRemove {
            cards.removeLast()
        }
        cards.forEach { card in
            card.isHidden = true
        }
        let last2Cards = Array(cards.suffix(2))
        switch last2Cards.count {
        case 2:
            last2Cards[0].isUserInteractionEnabled = false
            last2Cards[0].isHidden = false
            last2Cards[1].isUserInteractionEnabled = true
            last2Cards[1].isHidden = false
        case 1:
            last2Cards[0].isUserInteractionEnabled = true
            last2Cards[0].isHidden = false
        default:
            break
        }
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
