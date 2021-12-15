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
    
    var viewModel: [FavouriteWordzViewModel] = [
        .init(title: "To get out", secondTitles: ["Выйти наружу", "Выбраться отсюда"]),
        .init(title: "To find out", secondTitles: ["Выяснить", "Обнаруживать", "Разузнать"]),
        .init(title: "Words Words Words Words", secondTitles: ["Слова", "Какие-то слова"]),
        .init(title: "Words", secondTitles: ["Слово 1", "Слово 2"]),
        .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 2"]),
        .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 1", "Слово 1", "Слово 1"]),
        .init(title: "Words Wordz 1", secondTitles: ["Слово"]),
        .init(title: "Words KEK", secondTitles: ["Слово MEM"]),
        .init(title: "Words LOL", secondTitles: ["Слово"]),
    ] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let output: FavouriteWordzViewOutput
    
    private lazy var playButton: RVImageButton = {
        let button = RVImageButton(configuration: .init()
                                    .with(backgroundColor: .galadriel)
                                    .with(highlitedColor: .galadriel.withAlphaComponent(0.75))
                                    .with(image: .playGameIcon)
                                    .with(imageColor: .mysteryShack)
                                    .with(isFullyRounded: true)
                                    .with(imageAspectRation: 0.5)
                                    .with(onTap: { [weak self] button in
            guard let self = self else { return }
            guard button.alpha != 0.0 else { return }
            UIApplication.hapticLight()
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView = UITableView()
    
    init(output: FavouriteWordzViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    private func presentAlertWith(title: String) {
        let vc = UIAlertController(title: title, message: "Some message", preferredStyle: .alert)
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
        tableView.backgroundColor = .clear
        setupNavigation()
        
        addTableView()
        addPlayButton()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Your favourite wordz"
    }
    
    private func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(
            WordsPreviewViewTableViewCell.self,
            forCellReuseIdentifier: WordsPreviewViewTableViewCell.reuseID
        )
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
    
    private func addPlayButton() {
        view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.heightAnchor.constraint(equalToConstant: 48.0),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0),
            playButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0)
        ])
    }
    
}

extension FavouriteWordzViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = viewModel[indexPath.row]
        return WordsPreviewView.height(configuration: .init(title: data.title)
                                        .with(translations: data.secondTitles))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 150.0 {
            guard playButton.alpha > 0.0 else { return }
            playButton.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self else { return }
                self.playButton.alpha = 0.0
                self.playButton.transform = .init(translationX: 20.0, y: 0.0)
            }
        } else {
            guard playButton.alpha < 1.0 else { return }
            playButton.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self else { return }
                self.playButton.alpha = 1.0
                self.playButton.transform = .init(translationX: 0.0, y: 0.0)
            }
        }
    }
}

extension FavouriteWordzViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequedCell = tableView.dequeueReusableCell(withIdentifier: WordsPreviewViewTableViewCell.reuseID)
        guard let cell = dequedCell as? WordsPreviewViewTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel[indexPath.row]
        cell.backgroundColor = .gendalf
        cell.configure(configuration: .init(title: data.title)
                        .with(translations: data.secondTitles))
        return cell
    }
    
}

extension FavouriteWordzViewController: FavouriteWordzViewInput {
    
}

