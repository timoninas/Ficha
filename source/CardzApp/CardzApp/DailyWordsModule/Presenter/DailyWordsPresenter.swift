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
            DailyWordsViewController.ViewModel(title: "Words", subtitles: ["Harper's words came faster now", "Tracy listened to his words, first with shock and then with growing anger. He made her sound like an outcast, a leper"], translations: ["Слова"]),
            DailyWordsViewController.ViewModel(title: "Interesting", subtitles: nil, translations: ["Интересный"]),
            DailyWordsViewController.ViewModel(title: "Interesting message was sended in my pocket", subtitles: nil, translations: ["Интересное сообщение было отправлено в моем кармане"]),
            DailyWordsViewController.ViewModel(title: "Joke", subtitles: ["It was a joke, of course, Percy was happy, not in a serious grabbing mood at all, but Delacroix didn't know that"], translations: ["Это была шутка, конечно, Перси был счастлив, совсем не в серьезном настроении, но Делакруа этого не знал"]),
            DailyWordsViewController.ViewModel(title: "Pleasantry", subtitles: nil, translations: ["Любезность"]),
            DailyWordsViewController.ViewModel(title: "Silly", subtitles: nil, translations: ["Глупый"]),
            DailyWordsViewController.ViewModel(title: "to get out", subtitles: ["Suddenly I was terrified, almost choked with a need to get out of there", "Who told you to get out ?"], translations: ["Выйти наружу"]),
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
