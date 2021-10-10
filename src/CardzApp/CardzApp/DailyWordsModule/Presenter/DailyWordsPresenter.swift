//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation

final class DailyWordsPresenter: DailyWordsOutput {
    
    weak var input: DailyWordsViewInput?
    
    init() { }
    
    func viewDidLoad() {
        self.fetchData()
    }
    
    private func fetchData() {
        let viewModel = [
            DailyWordsViewController.ViewModel(title: "Words", subtitles: ["Harper's words came faster now", "Tracy listened to his words, first with shock and then with growing anger. He made her sound like an outcast, a leper"]),
            DailyWordsViewController.ViewModel(title: "Cardz", subtitles: nil),
            DailyWordsViewController.ViewModel(title: "Lol kek cheburek zaza papa", subtitles: ["Nichego man"])
        ]
        self.handleSuccess(viewModel)
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        self.input?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        self.input?.changeState(state: .error)
    }
    
}
