//
//  FavouriteWordzViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import UIKit
import Rivendell
import RevolvetraKnowledge

/// Контроллер с избранными словами, которые добавил пользователь.
final class FavouriteWordzViewController: UIViewController {
    
    var viewModel: [FavouriteWordzViewController.ViewModel] = [] {
        didSet {
            guard viewModel != oldValue else { return }
            tableView.reloadData()
            updateVisabilityLabel(isHidden: viewModel.isEmpty)
        }
    }
    
    private struct Constants {
        static var maxCountWordz: Int { KnowledgeCards.minCountCardToLearn }
    }
    
    private let output: FavouriteWordzViewOutput
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add words to the favorites category 😉"
        label.textAlignment = .center
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 28.0)
        label.numberOfLines = 3
        return label
    }()
    
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
            if self.viewModel.prefix(Constants.maxCountWordz).count < 5 {
                self.showAlertNeedMoreWords()
            } else if self.viewModel
                        .filter({ $0.displayedCount <= 2 })
                        .count < Constants.maxCountWordz {
                self.showAlertResetModule()
            } else {
                self.showLearnCardModule()
            }
        }))
        return button
    }()
    
    private let tableView = UITableView()
    
    init(output: FavouriteWordzViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    private func showLearnCardModule() {
        let shuffled = viewModel
            .filter({ $0.displayedCount <= 2 })
            .shuffled()
            .prefix(10)
            .map { LearnWordzCardView.ViewModel(
                wordz: $0.wordz,
                translations: $0.translations,
                transcription: $0.transcription,
                wordzExamples: $0.wordzExamples,
                type: $0.type,
                languageVersion: $0.languageVersion,
                displayedCount: $0.displayedCount
            )}
        let module = goJourney(.learnCard(viewModel: shuffled))
        present(module, animated: true, completion: nil)
    }
    
    private func showAlertResetModule() {
        let module = goJourney(.alert(model: .init(title: "Want to reset your progress?",
                                                   secondTitle: "Congratulations, you have learned all the words from this category",
                                                   actions: [.init(title: "Nope", onSwipeClosure: {
            RLogDebug(message: "Not resetting static", subsystem: String(describing: self))
        }),
                                                             .init(title: "Yep", onSwipeClosure: { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                guard let self = self else { return }
                self.output.resetWordsStat()
            }
            
        })])))
        
        module.modalPresentationStyle = .fullScreen
        module.modalTransitionStyle = .crossDissolve
        present(module, animated: true, completion: nil)
    }
    
    private func showAlertNeedMoreWords() {
        let module = goJourney(.alert(model: .init(title: "Add more words to your favorite category",
                                                   secondTitle: "You need at least 5 words in the favourite category",
                                                   actions: [.init(title: "Ok", onSwipeClosure: {
            RLogDebug(message: "Ok, need more words", subsystem: String(describing: self))
        })])))
        
        module.modalPresentationStyle = .fullScreen
        module.modalTransitionStyle = .crossDissolve
        present(module, animated: true, completion: nil)
    }
    
    private func presentAlertWith(title: String) {
        let vc = UIAlertController(title: title, message: "Some message", preferredStyle: .alert)
        vc.addAction(.init(title: title, style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output.viewDidLoad()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewDidAppear()
        RLogDebug(message: "viewWillAppear", subsystem: String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        tableView.backgroundColor = .clear
        setupNavigation()
        
        addTableView()
        addPlayButton()
        addLabel()
        
        updateVisabilityLabel(isHidden: viewModel.isEmpty)
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.barTintColor = .gendalf
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.urukhigh]
        navigationItem.title = "Your favourite wordz"
    }
    
    private func addLabel() {
        view.addSubview(emptyLabel)
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            emptyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
        ])
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
            playButton.heightAnchor.constraint(equalToConstant: 52.0),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0),
            playButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0)
        ])
    }
    
    // MARK: - Private methods
    
    private func updateVisabilityLabel(isHidden: Bool) {
        UIView.animate(withDuration: 0.01) { [weak self] in
            guard let self = self else { return }
            self.emptyLabel.alpha = isHidden ? 1.0 : 0.0
            self.playButton.isHidden = isHidden
        }
    }
    
}

extension FavouriteWordzViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = viewModel[indexPath.row]
        return WordsPreviewView.height(configuration: .init(title: data.wordz)
                                        .with(translations: data.translations))
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
        cell.selectionStyle = .none
        cell.backgroundColor = .gendalf
        cell.configure(configuration: .init(title: data.wordz)
                        .with(translations: data.translations)
                        .with(isDone: data.displayedCount > 2))
        return cell
    }
    
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, swipeButtonView, completion) in
            guard let self = self else { return }
            UIApplication.hapticLight()
            self.output.deleteAt(index: indexPath.row)
        }
        action.backgroundColor = .neonRed
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            self.makeDeleteContextualAction(forRowAt: indexPath)
        ])
    }
    
}

extension FavouriteWordzViewController: FavouriteWordzViewInput {
    
    func changeState(state: SimpleScreenState<[FavouriteWordzViewController.ViewModel]>) {
        switch state {
        case .normal(model: let viewModel):
            self.viewModel = viewModel
        case .error:
            break
        }
    }
    
}

