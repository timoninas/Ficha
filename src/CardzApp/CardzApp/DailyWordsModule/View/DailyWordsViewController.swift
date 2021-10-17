//
//  ViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit

final class DailyWordsViewController: UIViewController {
    
    weak var presenter: DailyWordsOutput?
    
    let todayView = TodayWordsView(configuration: .init()
                                    .with(title: "Words")
                                    .with(subtitles: ["Some word", "Another word"]))
    
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
    
    private let header = DailyWordsHeader()
    
    init(output: DailyWordsOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
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
        
//        self.addImage()
        self.addScrollView()
        self.addHeader()
        self.addTodayView()
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
        self.header.onTap = { print("Tapped") }
        self.scrollView.addSubview(self.header)
        self.header.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10.0).isActive = true
        self.header.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0).isActive = true
        self.header.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0).isActive = true
    }
    
    private func addTodayView() {
        self.scrollView.addSubview(self.todayView)
        self.todayView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 10.0).isActive = true
        self.todayView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0).isActive = true
        self.todayView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0).isActive = true
        self.todayView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor).isActive = true
        self.todayView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
    }
    
    private func addImage() {
        self.view.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 14.0).isActive = true
        self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 14.0).isActive = true
    }

}

extension DailyWordsViewController: DailyWordsViewInput {
    
    func changeState(state: DailyWordsViewController.State) {
        switch state {
        case .content(let viewModel):
            print(viewModel)
        case .error:
            print("Oshibka")
        }
    }
    
}

extension DailyWordsViewController: UIScrollViewDelegate {
    
}
