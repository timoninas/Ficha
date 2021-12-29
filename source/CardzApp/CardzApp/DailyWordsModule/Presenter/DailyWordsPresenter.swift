//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation

import RevoletraUserDefaultsKeys
import RevolvetraKnowledge
import RevolvetraUserDefaults

final class DailyWordsPresenter: DailyWordsOutput {
    
    weak var view: DailyWordsViewInput?
    
    init() { }
    
    func viewDidLoad() {
        self.mockFetchData()
    }
    
    func viewWillAppear() {
        KnowledgeProfile.isOnborded = false
        if !KnowledgeProfile.isOnborded {
            KnowledgeProfile.isOnborded = true
            showOnboarding()
        }
    }
    
    func showOnboarding() {
        let model: OnboardingModuleModel = .init(
            onboardingModels: [
                .init(image: .animals, title: ""),
                .init(image: .animals, title: "Че то там"),
                .init(image: .architecture, title: "Njefw wjekfwejf jkwef nwkefn kwejfnkwefnkwe fnjkwejf wefwe fwe wef we fwe fwefwefwef wef we fwe fwef wef wef we fews fwef we fwe fwe fwe fwe f"),
                .init(image: .onboarding1, title: "Swipe these cards!")
            ]
        )
        view?.showOnboardingModule(model: model)
    }
    
    private func fetchData() {
        
    }
    
    private func isNewDay() -> Bool {
        let currentDate = Date.now
        let currentCalendar = Calendar.current
        let currentComponents = currentCalendar.dateComponents([.month, .day], from: currentDate)
        let currentMonth = currentComponents.month
        let currentDay = currentComponents.day
        
        let lastVisitDate = KnowledgeProfile.lastVisitAppDate
        let lastCalendar = Calendar.current
        let lastComponents = lastCalendar.dateComponents([.month, .day], from: lastVisitDate)
        let lastMonth = lastComponents.month
        let lastDay = lastComponents.day
        
        if lastMonth != currentMonth || lastDay != currentDay {
            KnowledgeProfile.lastVisitAppDate = currentDate
            return true
        }
        
        return false
    }
    
    private func refillDailyWords() {
        let newDailyWords = [
            DailyWordsUserDefaults(
                title: "Words",
                examples: ["Harper's words came faster now", "Tracy listened to his words, first with shock and then with growing anger. He made her sound like an outcast, a leper"],
                translations: ["kek"]),
            
            DailyWordsUserDefaults(title: "Interesting", examples: ["Интересный"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Words", examples: ["Интересный"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Interesting message was sended in my pocket", examples: ["Интересное сообщение было отправлено в моем кармане"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Joke", examples: ["It was a joke, of course, Percy was happy, not in a serious grabbing mood at all, but Delacroix didn't know that"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Silly", examples: ["Глупый"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "to get out", examples: ["Suddenly I was terrified, almost choked with a need to get out of there", "Who told you to get out ?"], translations: ["kek"]),
        ]
        DailyWordsUserDefaultsCache.save(newDailyWords.shuffled())
    }
    
    private func mockFetchData() {
        if isNewDay() {
            DailyWordsUserDefaultsCache.remove()
            refillDailyWords()
        }
        
        var array = DailyWordsUserDefaultsCache.get()
        
        if array.isEmpty {
            refillDailyWords()
            array = DailyWordsUserDefaultsCache.get()
        }
        
        handleSuccess(array.map { DailyWordsViewController.ViewModel(title: $0.title, subtitles: $0.examples, translations: $0.translations) })
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        self.view?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        self.view?.changeState(state: .error)
    }
    
}
