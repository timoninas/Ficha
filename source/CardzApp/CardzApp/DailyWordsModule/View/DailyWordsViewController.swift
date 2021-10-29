//
//  ViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Rivendell

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
    
    private var todayConstraints: [NSLayoutConstraint] = []
    private var heightConstraints: [NSLayoutConstraint] = []
    
    init(output: DailyWordsOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.renderHeights()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gendalf
        self.configureUI()
        self.output.viewDidLoad()
    }
    
    private func configureUI() {
        self.addBackgroundView()
        
        self.addScrollView()
        self.addHeader()
        self.renderContent(isAnimated: false)
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
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            print("Tapped")
        }
        self.scrollView.addSubview(self.header)
        self.header.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10.0).isActive = true
        self.header.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0).isActive = true
        self.header.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0).isActive = true
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
