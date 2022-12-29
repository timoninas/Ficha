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
    
    private var states: [SettingCellView.State] = [
        .onlyTitle(title: "Top swipes count: \(KnowledgeStats.topSwipesLearnCard)"),
        .onlyTitle(title: "Right swipes count: \(KnowledgeStats.rightSwipesLearnCard)"),
        .onlyTitle(title: "Left swipes count: \(KnowledgeStats.leftSwipesLearnCard)"),
        .onlyTitle(title: "Drags count: \(KnowledgeStats.dragsLearnCard)"),
        .onlyTitle(title: "App version: \(KnowledgeDevice.appVersion ?? "?")"),
        .switcher(title: "Is enabled hiding favourite", initialState: KnowledgeDevice.isEnabledHidingAddFavouriteHeader, closure: { isEnabled in
            KnowledgeDevice.isEnabledHidingAddFavouriteHeader = isEnabled
        })
    ]
    
    private var cancellable: Set<AnyCancellable> = []
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var closeButton: RVImageButton = {
        let button = RVImageButton(configuration: .init()
                                    .with(image: .bulbLight)
                                    .with(backgroundColor: .clear)
                                    .with(highlitedColor: .clear)
                                    .with(imageColor: .mysteryShack))
        button.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                guard let self else { return }
                UIApplication.hapticLight()
                self.dismiss(animated: true, completion: nil)
            }
            .store(in: &cancellable)
        return button
    }()
    
    
    init(output: DeveloperScreenViewOutput) {
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        setupNavigation()
        addTableView()
        addCloseButton()
    }
    
    private func addTableView() {
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(
            SettingCollectionViewCell.self,
            forCellWithReuseIdentifier: SettingCollectionViewCell.reuseID
        )
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
    }
    
    private func setupNavigation() {
        navigationItem.title = "Developer Screen"
        navigationController?.navigationBar.barTintColor = .gendalf
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.urukhigh]
    }
    
}

extension DeveloperScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let state = states[indexPath.row]
        let configuration = SettingCellView.Configuration(state: state)
        let height = SettingCellView.height(configuration: configuration)
        let cellSize = CGSize(width: collectionView.frame.width, height: height)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 20, right: 0)
    }
    
}

extension DeveloperScreenViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        states.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SettingCollectionViewCell.reuseID,
            for: indexPath
        )
        guard let cell = dequedCell as? SettingCollectionViewCell else {
            return UICollectionViewCell()
        }
        let state = states[indexPath.row]
        cell.backgroundColor = .gendalf
        cell.configure(configuration: .init(state: state))
        return cell
    }
    
}

extension DeveloperScreenViewController: DeveloperScreenViewInput {
    
}
