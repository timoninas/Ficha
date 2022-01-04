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
        .onlyTitle(title: "Drags count: \(KnowledgeStats.dragsLearnCard)")
    ]
    
    private var cancellable: Set<AnyCancellable> = []
    
    private let tableView = UITableView()
    
    private lazy var closeButton: RVImageButton = {
        let button = RVImageButton(configuration: .init()
                                    .with(image: .closeIcon)
                                    .with(backgroundColor: .clear)
                                    .with(highlitedColor: .clear)
                                    .with(imageColor: .nazgul))
        button.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                guard let self = self else { return }
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
        view.backgroundColor = .gendalf
        configureUI()
        output?.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        setupNavigation()
        addTableView()
        addCloseButton()
    }
    
    private func addTableView() {
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(
            SettingTableViewCell.self,
            forCellReuseIdentifier: SettingTableViewCell.reuseID
        )
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
    
    private func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.renderAsCloseButton(view: view)
    }
    
    private func setupNavigation() {
        navigationItem.title = "Developer Screen"
        navigationController?.navigationBar.barTintColor = .gendalf
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.urukhigh]
    }
    
}

extension DeveloperScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let state = states[indexPath.row]
        let configuration = SettingCellView.Configuration(state: state)
        return SettingCellView.height(configuration: configuration)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension DeveloperScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        states.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequedCell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseID)
        guard let cell = dequedCell as? SettingTableViewCell else {
            return UITableViewCell()
        }
        let state = states[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .gendalf
        cell.configure(configuration: .init(state: state))
        return cell
    }
    
}

extension DeveloperScreenViewController: DeveloperScreenViewInput {
    
}
