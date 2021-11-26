//
//  FavouriteWordzViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import UIKit
import Rivendell

/// Контроллер с избранными словами, которые добавил пользователь.
final class FavouriteWordzViewController: UIViewController {
    
    private let output: FavouriteWordzViewOutput
    
    private lazy var button = RVButton(configuration: .init()
                                        .with(title: "Open Notification")
                                        .with(subtitle: "Well, click!")
                                        .with(highlitedColor: .mysteryShack.withAlphaComponent(0.8))
                                        .with(onTap: { [weak self] _ in
        guard let self = self else { return }
        let module = AlertCardBuilder.build(model:
                                                    .init(title: "Are you sure you want to reset your progress?",
                                                          secondTitle: "Resetting the progress will lead to a complete clearing of the statistics of the learned words",
                                                          actions: [.init(title: "Nope", onSwipeClosure: { [weak self] in
            guard let self = self else { return }
            print("Swipe Net")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.presentAlertWith(title: "Nope")
            }
            
        }),
                                                                    .init(title: "Yep", onSwipeClosure: { [weak self] in
            guard let self = self else { return }
            print("Swipe Da")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.presentAlertWith(title: "Yep")
            }
        })]))
        
        module.modalPresentationStyle = .fullScreen
        module.modalTransitionStyle = .crossDissolve
        self.present(module, animated: true, completion: nil)
    }))
    
    init(output: FavouriteWordzViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    private func presentAlertWith(title: String) {
        let vc = UIAlertController(title: "Alert", message: "Some message", preferredStyle: .alert)
        vc.addAction(.init(title: title, style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
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
        addOpenAlertButton()
    }
    
    private func addOpenAlertButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
        ])
    }
    
}

extension FavouriteWordzViewController: FavouriteWordzViewInput {
    
}

