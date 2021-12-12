//
//  ViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Rivendell
import EyeOfSauron
import Hobbiton

final class DailyWordsViewController: UIViewController {
    
    var viewModels: [ViewModel] = [] {
        didSet {
            guard viewModels != oldValue else { return }
            renderContent(isAnimated: true)
        }
    }
    
    private var viewModelToLearnWordzViewModel: (ViewModel) -> LearnWordzCardView.ViewModel = {
        .init(
            wordz: $0.title,
            translations: $0.translations,
            wordzExamples: $0.subtitles ?? []
        )
    }
    
    var wordsView: [TodayWordsView] = []
    
    let imageView = UIImageView(image: .revolvetra)
    
    let containerView = UIView()
    
    let backView = BubblesView()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let output: DailyWordsOutput
    
    private let header: DailyWordsHeader = {
        let header = DailyWordsHeader()
        header.title = "Daily Words"
        return header
    }()
    
    private let playButton: RVImageButton = {
        let button = RVImageButton(configuration: .init()
                                    .with(backgroundColor: .galadriel)
                                    .with(highlitedColor: .galadriel.withAlphaComponent(0.75))
                                    .with(image: .playGameIcon)
                                    .with(imageColor: .mysteryShack)
                                    .with(isFullyRounded: true)
                                    .with(imageAspectRation: 0.5))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var todayConstraints: [NSLayoutConstraint] = []
    private var heightConstraints: [NSLayoutConstraint] = []
    
    init(output: DailyWordsOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RLogInfo(message: "[Info] \(String(describing: self)) ViewDidLoad")
        view.backgroundColor = .gendalf
        configureUI()
        output.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        renderHeights()
        updateVisabilityBubbles(isHidden: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        updateVisabilityBubbles(isHidden: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
        addBackgroundView()
        addScrollView()
        addHeader()
        addPlayButton()
        
        backView.alpha = 0.0
        playButton.alpha = 0.0
        
        renderContent(isAnimated: false)
    }
    
    private func addBackgroundView() {
        view.addSubview(backView)
        backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func addHeader() {
        header.onTap = {
        }
        scrollView.addSubview(header)
        header.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10.0).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0).isActive = true
    }
    
    private func addPlayButton() {
        playButton.configuration = playButton.configuration
            .with(onTap: { [weak self] _ in
                guard let self = self else { return }
                UIApplication.hapticLight()
                let module = LearnCardBuilder.build(viewModel: self.viewModels.map { self.viewModelToLearnWordzViewModel($0) })
                module.modalTransitionStyle = .coverVertical
                module.modalPresentationStyle = .overFullScreen
                self.present(module, animated: true, completion: nil)
            })
        
        view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.heightAnchor.constraint(equalToConstant: 48.0),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0),
            playButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0)
        ])
    }
    
    private func renderTodayViews() {
        NSLayoutConstraint.deactivate(todayConstraints)
        todayConstraints.removeAll()
        
        wordsView.forEach { view in
            if view.superview != nil {
                view.removeFromSuperview()
            }
        }
        
        var previousView: TodayWordsView?
        for (idx, viewModel) in viewModels.enumerated() {
            let todayView = TodayWordsView(configuration: .init()
                                            .with(title: viewModel.title)
                                            .with(subtitles: viewModel.subtitles))
            scrollView.addSubview(todayView)
            wordsView.append(todayView)
            if idx == 0 {
                todayConstraints += [
                    todayView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10.0),
                    
                ]
            } else {
                if idx == viewModels.count - 1 {
                    todayConstraints += [
                        todayView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor, constant: -30.0)
                    ]
                }
                if let view = previousView {
                    todayConstraints += [
                        todayView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 30.0)
                    ]
                }
            }
            
            todayConstraints += [
                todayView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
                todayView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            ]
            
            previousView = todayView
        }
        
        NSLayoutConstraint.activate(todayConstraints)
    }
    
    private func renderHeights() {
        NSLayoutConstraint.deactivate(heightConstraints)
        heightConstraints.removeAll()
        
        wordsView.forEach { view in
            heightConstraints += [
                view.heightAnchor.constraint(equalToConstant: view.height() + 25)
            ]
        }
        
        NSLayoutConstraint.activate(heightConstraints)
    }
    
    private func renderContent(isAnimated: Bool) {
        // TODO: - Добавить нормальную анимацию появления коллекции.
        if isAnimated {
            renderTodayViews()
            renderHeights()
        } else {
            renderTodayViews()
            renderHeights()
        }
    }
    
    private func updateVisabilityBubbles(isHidden: Bool) {
        UIView.animate(withDuration: 0.45) { [weak self] in
            guard let self = self else { return }
            self.backView.alpha = isHidden ? 0.0 : 1.0
            self.playButton.alpha = isHidden ? 0.0 : 1.0
        }
    }
    
}

extension DailyWordsViewController: DailyWordsViewInput {
    
    func changeState(state: DailyWordsViewController.State) {
        switch state {
        case .content(let viewModel):
            viewModels = viewModel
            print(viewModel)
        case .error:
            print("Oshibka")
        }
    }
    
}

extension DailyWordsViewController: UIScrollViewDelegate {
    
}
