//
//  DevViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit
import Rivendell

final class DevDebugViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let merger = MergerImagerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print("viewDidLoad \(String(describing: self))")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        addMerger()
    }
    
    private func addMerger() {
        view.addSubview(merger)
        merger.configuration = merger.configuration
            .with(firstImageConfig: .visible(image: .doneIcon, tintColor: .mysteryShack, aspectRatio: 1.0))
            .with(secondImageConfig: .visible(image: .circleDone, tintColor: .mysteryShack, aspectRatio: 1.0))
        NSLayoutConstraint.activate([
            merger.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            merger.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            merger.heightAnchor.constraint(equalToConstant: 21.0),
            merger.widthAnchor.constraint(equalTo: merger.heightAnchor)
        ])
    }
    
}
