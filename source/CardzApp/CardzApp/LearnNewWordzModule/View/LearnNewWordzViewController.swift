//
//  LearnNewWordzViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import UIKit
import Rivendell

final class LearnNewWordzViewController: UIViewController {
    
    var output: LearnNewWordzOutput?
    
    private let thematicView = BubbleThematicWordsView(configuration: .init(title: "Lol Kek cheburek")
                                                        .with(iconImage: .revolvetra)
                                                        .with(backgroundColor: .softMint)
                                                        .with(cornerRadius: 13.0))
    
    init(output: LearnNewWordzOutput) {
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
        view.addSubview(thematicView)
        NSLayoutConstraint.activate([
            thematicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            thematicView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            thematicView.heightAnchor.constraint(equalToConstant: 130.0),
            thematicView.widthAnchor.constraint(equalToConstant: 100.0),
        ])
    }
    
    
}

extension LearnNewWordzViewController: LearnNewWordzInput {
    
}

