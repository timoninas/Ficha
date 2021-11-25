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
    
    /// Представление экрана уведомления.
    struct AlertViewModel: Equatable {
        
        /// Заголовок уведомления.
        let title: String
        
        /// Детальное описание уведомления.
        let secondTitle: String?
        
    }
    
    private let output: AlertCardViewOutput
    private var viewModel: AlertViewModel
    
    private lazy var alertCardView = AlertCardView(swipeDirections: [.left, .right], configuration: .init()
                                                    .with(title: viewModel.title)
                                                    .with(secondTitle: viewModel.secondTitle)
    )
    
    private var leftButton = RVLeftRightImageButton(configuration: .init())
    private lazy var closeButton = RVImageButton(configuration: .init()
                                                    .with(image: .closeIcon)
                                                    .with(backgroundColor: .clear)
                                                    .with(highlitedColor: .clear)
                                                    .with(imageColor: .nazgul)
                                                    .with(onTap: { [weak self] _ in
        guard let self = self else { return }
        self.dismiss(animated: true, completion: nil)
    }))
    
    private lazy var button = RVButton(configuration: .init()
                                        .with(title: "Tap to me!")
                                        .with(subtitle: "Тап закроет эту кнопку")
                                        .with(highlitedColor: .mysteryShack.withAlphaComponent(0.8))
                                        .with(onTap: { [weak self] _ in
        guard let self = self else { return }
        let module = AlertCardBuilder.build(data: .init(title: "KKEE", secondTitle: "FEFEF"))
        module.modalPresentationStyle = .fullScreen
        module.modalTransitionStyle = .crossDissolve
        self.present(module, animated: true, completion: nil)
    }))
    
    init(output: AlertCardViewOutput, viewModel: AlertViewModel) {
        self.output = output
        self.viewModel = viewModel
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
        RLogInfo(message: "[Info] \(String(describing: self)) ViewDidLoad")
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        addRvButton()
        addAlertCard()
        addCloseButton()
        addLeftButton()
    }
    
    private func addAlertCard() {
        view.addSubview(alertCardView)
        alertCardView.backgroundColor = .whisper
        
        NSLayoutConstraint.activate([
            alertCardView.heightAnchor.constraint(equalToConstant: view.safeAreaHeight / 1.75),
            alertCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertCardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            alertCardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
        ])
    }
    
    private func addLeftButton() {
        view.addSubview(leftButton)
        leftButton.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            leftButton.heightAnchor.constraint(equalToConstant: 70.0),
            leftButton.widthAnchor.constraint(equalToConstant: 100.0),
            leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leftButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
        ])
    }
    
    private func addRvButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            button.widthAnchor.constraint(equalToConstant: 200.0),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
        ])
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
    
}

extension AlertCardViewController: AlertCardViewInput {
    
}
