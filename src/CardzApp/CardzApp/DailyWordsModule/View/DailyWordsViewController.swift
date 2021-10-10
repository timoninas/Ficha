//
//  ViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit

final class DailyWordsViewController: UIViewController {
    
    weak var presenter: DailyWordsOutput?
    
    let todayView = TodayWordsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gendalf
        self.configureUI()
    }
    
    private func configureUI() {
        self.addTodayView()
    }
    
    private func addTodayView() {
        self.view.addSubview(self.todayView)
        self.todayView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30.0).isActive = true
        self.todayView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -14.0).isActive = true
        self.todayView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 14.0).isActive = true
        self.todayView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
    }

}

extension DailyWordsViewController: DailyWordsViewInput {
    
}

