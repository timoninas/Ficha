//
//  DeveloperScreenViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 13.12.2021.
//

import UIKit

final class DeveloperScreenViewController: UIViewController {
    
    var output: DeveloperScreenViewOutput?
    
    init(output: DeveloperScreenViewOutput) {
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
        navigationItem.title = "Developer Screen"
        navigationController?.navigationBar.barTintColor = .urukhigh
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.urukhigh]
    }
    
    
}

extension DeveloperScreenViewController: DeveloperScreenViewInput {
    
}

