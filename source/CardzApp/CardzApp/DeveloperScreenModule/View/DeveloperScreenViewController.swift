//
//  DeveloperScreenViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 13.12.2021.
//

import UIKit
import Rivendell
import Hobbiton
import Combine

import RevolvetraKnowledge

final class DeveloperScreenViewController: UIViewController {
    
    var output: DeveloperScreenViewOutput?
    
    let labelTopSwipe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Top swipes count: \(KnowledgeStats.topSwipesLearnCard)"
        return label
    }()
    
    let labelRightSwipe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Right swipes count: \(KnowledgeStats.rightSwipesLearnCard)"
        return label
    }()
    
    let labelLeftSwipe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Left swipes count: \(KnowledgeStats.leftSwipesLearnCard)"
        return label
    }()
    
    let labelDrag: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Drags count: \(KnowledgeStats.dragsLearnCard)"
        return label
    }()
    
    private var cancellable: Set<AnyCancellable> = []
    
    private lazy var playButton: RVImageButton = {
        let button = RVImageButton(configuration: .init()
                                    .with(backgroundColor: .galadriel)
                                    .with(highlitedColor: .galadriel.withAlphaComponent(0.75))
                                    .with(image: .playGameIcon)
                                    .with(imageColor: .mysteryShack)
                                    .with(isFullyRounded: true)
                                    .with(imageAspectRation: 0.5)
                                    )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.publisher(for: .touchUpInside)
            .sink { _ in
                print("lol")
            }
            .store(in: &cancellable)

        return button
    }()
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        setupNavigation()
        addCloseButton()
        addTitles()
        addButton()
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func setupNavigation() {
        navigationItem.title = "Developer Screen"
        navigationController?.navigationBar.barTintColor = .urukhigh
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.urukhigh]
    }
    
    private func addTitles() {
        view.addSubview(labelTopSwipe)
        view.addSubview(labelRightSwipe)
        view.addSubview(labelLeftSwipe)
        view.addSubview(labelDrag)
        
        labelTopSwipe.sizeToFit()
        labelRightSwipe.sizeToFit()
        labelLeftSwipe.sizeToFit()
        
        NSLayoutConstraint.activate([
            labelTopSwipe.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            labelTopSwipe.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            labelTopSwipe.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            
            labelRightSwipe.topAnchor.constraint(equalTo: labelTopSwipe.bottomAnchor, constant: 10.0),
            labelRightSwipe.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            labelRightSwipe.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            
            labelLeftSwipe.topAnchor.constraint(equalTo: labelRightSwipe.bottomAnchor, constant: 10.0),
            labelLeftSwipe.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            labelLeftSwipe.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            
            labelDrag.topAnchor.constraint(equalTo: labelLeftSwipe.bottomAnchor, constant: 10.0),
            labelDrag.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            labelDrag.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
        ])
    }
    
    private func addButton() {
        view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25.0),
            playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25.0),
            playButton.heightAnchor.constraint(equalToConstant: 50.0),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor)
        ])
    }
    
}

extension DeveloperScreenViewController: DeveloperScreenViewInput {
    
}

