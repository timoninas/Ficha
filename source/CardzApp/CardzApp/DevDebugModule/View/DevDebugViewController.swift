//
//  DevViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit
import Rivendell
import Hobbiton

final class DevDebugViewController: UIViewController {
    
    
    private var blurView = BlurView()
    
    private var roundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mysteryShack
        view.layer.cornerRadius = 100.0
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        
        view.addSubview(roundView)
        NSLayoutConstraint.activate([
            roundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            roundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundView.heightAnchor.constraint(equalToConstant: 200.0),
            roundView.widthAnchor.constraint(equalToConstant: 200.0)
        ])
        
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            blurView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            blurView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            blurView.heightAnchor.constraint(equalToConstant: 300.0)
        ])
    }
    
}
