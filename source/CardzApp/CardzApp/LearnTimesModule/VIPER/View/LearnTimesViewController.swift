//
//  LearnTimesViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import UIKit

final class LearnTimesViewController: UIViewController {
    
    var output: LearnTimesOutput?
    
    init(output: LearnTimesOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output?.viewDidLoad()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
        RLogDebug(message: "viewDidAppear", subsystem: String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
    }
    
}

extension LearnTimesViewController: LearnTimesViewInput {
    
    func changeState(state: LearnTimesViewState) {
        switch state {
        case .content(let viewModel):
            RLogDebug(message: "viewModel: \(viewModel)", subsystem: String(describing: self))
        case .error:
            RLogDebug(message: "Change state to error", subsystem: String(describing: self))
        }
    }
    
}
