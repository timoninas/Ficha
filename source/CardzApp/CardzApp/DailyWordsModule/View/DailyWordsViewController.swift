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
            guard self.viewModels != oldValue else { return }
            self.renderContent(isAnimated: true)
        }
    }
    
    var wordsView: [TodayWordsView] = []
    
    let imageView = UIImageView(image: .revolvetra)
    
    let containerView = UIView()
    
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
        self.view.backgroundColor = .gendalf
        self.configureUI()
        self.output.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.renderHeights()
    }
    
    private func configureUI() {
        addBackgroundView()
        addScrollView()
        addHeader()
        addPlayButton()
        
        renderContent(isAnimated: false)
    }
    
    private func addBackgroundView() {
        let backView = BubblesView()
        self.view.addSubview(backView)
        backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        backView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func addScrollView() {
        self.view.addSubview(self.scrollView)
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func addHeader() {
        self.header.onTap = {
            UIApplication.hapticLight()
            print("Tapped")
        }
        self.scrollView.addSubview(self.header)
        self.header.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10.0).isActive = true
        self.header.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0).isActive = true
        self.header.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0).isActive = true
    }
    
    private func addPlayButton() {
        playButton.configuration = playButton.configuration
            .with(onTap: { [weak self] _ in
                guard let self = self else { return }
                UIApplication.hapticLight()
                print("KEKEKE")
                self.present(LearnCardBuilder.build(), animated: true, completion: nil)
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
        NSLayoutConstraint.deactivate(self.todayConstraints)
        self.todayConstraints.removeAll()
        
        self.wordsView.forEach { view in
            if view.superview != nil {
                view.removeFromSuperview()
            }
        }
        
        var previousView: TodayWordsView?
        for (idx, viewModel) in self.viewModels.enumerated() {
            let todayView = TodayWordsView(configuration: .init()
                                            .with(title: viewModel.title)
                                            .with(subtitles: viewModel.subtitles))
            self.scrollView.addSubview(todayView)
            self.wordsView.append(todayView)
            if idx == 0 {
                self.todayConstraints += [
                    todayView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 10.0),
                    
                ]
            } else {
                if idx == self.viewModels.count - 1 {
                    self.todayConstraints += [
                        todayView.bottomAnchor.constraint(lessThanOrEqualTo: self.scrollView.bottomAnchor, constant: -30.0)
                    ]
                }
                if let view = previousView {
                    self.todayConstraints += [
                        todayView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 30.0)
                    ]
                }
            }
            
            self.todayConstraints += [
                todayView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0),
                todayView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0),
            ]
            
            previousView = todayView
        }
        
        NSLayoutConstraint.activate(self.todayConstraints)
    }
    
    private func renderHeights() {
        NSLayoutConstraint.deactivate(self.heightConstraints)
        self.heightConstraints.removeAll()
        
        self.wordsView.forEach { view in
            self.heightConstraints += [
                view.heightAnchor.constraint(equalToConstant: view.height() + 25)
            ]
        }
        
        NSLayoutConstraint.activate(self.heightConstraints)
    }
    
    private func renderContent(isAnimated: Bool) {
        if isAnimated {
            UIView.animate(withDuration: 0.3, delay: 0.0,  options: [.curveEaseOut]) {
                self.renderTodayViews()
                self.renderHeights()
            }
        } else {
            self.renderTodayViews()
            self.renderHeights()
        }
    }

}

extension DailyWordsViewController: DailyWordsViewInput {
    
    func changeState(state: DailyWordsViewController.State) {
        switch state {
        case .content(let viewModel):
            self.viewModels = viewModel
            print(viewModel)
        case .error:
            print("Oshibka")
        }
    }
    
}

extension DailyWordsViewController: UIScrollViewDelegate {
    
}
