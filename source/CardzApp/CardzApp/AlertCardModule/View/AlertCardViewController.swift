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
                                                    .with(secondTitle: viewModel.secondTitle))
    
    private var leftButton = RVLeftRightImageButton(configuration: .init())
    
    init(output: AlertCardViewOutput, viewModel: AlertViewModel) {
        self.output = output
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RLogInfo(message: "[Info] \(String(describing: self)) ViewDidLoad")
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        addAlertCard()
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

}

extension AlertCardViewController: AlertCardViewInput {
    
}
