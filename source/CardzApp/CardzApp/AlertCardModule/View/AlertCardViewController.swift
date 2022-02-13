//
//  AlertCardViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.11.2021.
//

import UIKit
import Rivendell

/// Контроллер для отображения уведомления приложения с карточкой, которую нужно свайпнуть
/// Чтобы это уведомление закрылось.
final class AlertCardViewController: UIViewController {
    
    private let output: AlertCardViewOutput
    
    private var viewModel: AlertModel?
    
    private lazy var alertCardView = AlertCardView(swipeDirections: [.left, .right], configuration: .init()
    )
    
    private lazy var leftButton = RVAlignImageButton(configuration: .init()
                                                        .with(align: .top)
                                                        .with(imageConfig: .visible(image: .leftArrowIcon, color: .bloods))
                                                        .with(imageMultiplier: 1.0))
    
    private lazy var rightButton = RVAlignImageButton(configuration: .init()
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
        UIApplication.hapticLight()
        self.dismiss(animated: true, completion: nil)
    }))
    
    private let phantomCard = BaseCardView.phantomCard()
    
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
    
    init(output: AlertCardViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output.viewDidLoad()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        addCloseButton()
        addPhantomCard()
        addAlertCard()
        addCenteringViews()
        view.bringSubviewToFront(alertCardView)
    }
    
    private func addPhantomCard() {
        view.addSubview(phantomCard)
        NSLayoutConstraint.activate([
            phantomCard.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
            phantomCard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            phantomCard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            phantomCard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
        ])
    }
    
    private func addAlertCard() {
        alertCardView.onCardChangedPosition = { [weak self] _, _ in
            guard let self = self else { return }
            self.setUserInteractableToElements(isUserInteractible: false)
        }
        alertCardView.onCardEndChangedPosition = { [weak self] in
            guard let self = self else { return }
            self.setUserInteractableToElements(isUserInteractible: true)
        }
        
        view.addSubview(alertCardView)
        alertCardView.backgroundColor = .whisper
        
        alertCardView.withCardShadow()
        
        NSLayoutConstraint.activate([
            alertCardView.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
            alertCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertCardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            alertCardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
        ])
    }
    
    private func addCenteringViews() {
        view.addSubview(centerView)
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        NSLayoutConstraint.activate([
            centerView.widthAnchor.constraint(equalToConstant: 1.0),
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.topAnchor.constraint(equalTo: alertCardView.bottomAnchor),
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
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func setUserInteractableToElements(isUserInteractible: Bool) {
        leftButton.isUserInteractionEnabled = isUserInteractible
        rightButton.isUserInteractionEnabled = isUserInteractible
        closeButton.isUserInteractionEnabled = isUserInteractible
    }
    
    private func configureForModel() {
        guard let viewModel = viewModel else { return }
        alertCardView.configuration = alertCardView.configuration
            .with(title: viewModel.title)
            .with(secondTitle: viewModel.secondTitle)
        
        addActionButtons(actions: viewModel.actions)
        view.bringSubviewToFront(alertCardView)
    }
    
    private func addActionButtons(actions: [AlertModel.AlertAction]) {
        switch actions.count {
        case 1:
            guard let first = actions.first else { return }
            
            rightButton.configuration = rightButton.configuration
                .with(onTap: { [weak self] _ in self?.alertCardView.swipeTo(.right) })
                .with(titleConfig: .visible(title: first.title, color: .olivie))
            
            alertCardView.onEverySwipe(completion: { [weak self] in
                first.onSwipeClosure?()
                UIApplication.hapticLight()
                self?.dismiss(animated: true, completion: nil) })
            
            view.addSubview(rightButton)
            
            NSLayoutConstraint.activate([
                rightButton.heightAnchor.constraint(equalToConstant: 105.0),
                rightButton.widthAnchor.constraint(equalToConstant: 65.0),
                rightButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
                rightButton.topAnchor.constraint(equalTo: phantomCard.bottomAnchor, constant: 12.0),
            ])
            
            
        case 2:
            guard let first = actions.first else { return }
            guard let second = actions.last else { return }
            rightButton.configuration = rightButton.configuration
                .with(onTap: { [weak self] _ in self?.alertCardView.swipeTo(.right) })
                .with(titleConfig: .visible(title: second.title, color: .olivie))
            leftButton.configuration = leftButton.configuration
                .with(onTap: { [weak self] _ in self?.alertCardView.swipeTo(.left) })
                .with(titleConfig: .visible(title: first.title, color: .olivie))
            
            alertCardView.onLeftSwipe = { [weak self] in
                guard let self = self else { return }
                first.onSwipeClosure?()
                UIApplication.hapticLight()
                self.dismiss(animated: true, completion: nil)
            }
            
            alertCardView.onRightSwipe = { [weak self] in
                guard let self = self else { return }
                second.onSwipeClosure?()
                UIApplication.hapticLight()
                self.dismiss(animated: true, completion: nil)
            }
            
            view.addSubview(leftButton)
            
            NSLayoutConstraint.activate([
                leftButton.heightAnchor.constraint(equalToConstant: 105.0),
                leftButton.widthAnchor.constraint(equalToConstant: 65.0),
                leftButton.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
                leftButton.topAnchor.constraint(equalTo: phantomCard.bottomAnchor, constant: 12.0),
            ])
            
            view.addSubview(rightButton)
            
            NSLayoutConstraint.activate([
                rightButton.heightAnchor.constraint(equalToConstant: 105.0),
                rightButton.widthAnchor.constraint(equalToConstant: 65.0),
                rightButton.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
                rightButton.topAnchor.constraint(equalTo: phantomCard.bottomAnchor, constant: 12.0),
            ])
        default:
            alertCardView.onEverySwipe(completion: { [weak self] in
                UIApplication.hapticLight()
                self?.dismiss(animated: true, completion: nil) })
        }
        
    }
}

extension AlertCardViewController: AlertCardViewInput {
    
    func changeState(state: SimpleScreenState<AlertModel>) {
        switch state {
        case .normal(model: let model):
            let actions = Array(model.actions.prefix(2))
            viewModel = .init(title: model.title,
                              secondTitle: model.secondTitle,
                              actions: actions)
            configureForModel()
        case .error:
            RLogDebug(message: "Change state to error", subsystem: String(describing: self))
        }
        
    }
    
}
