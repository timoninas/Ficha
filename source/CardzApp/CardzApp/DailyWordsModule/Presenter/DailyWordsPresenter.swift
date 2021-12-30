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
    
    private struct Constants {
        static var dailyWordsCount: Int { 12 }
    }
    
    weak var view: DailyWordsViewInput?
    
    init() { }
    
    func viewDidLoad() {
        mockFetchData()
    }
    
    func viewWillAppear() {
        if !KnowledgeProfile.isOnborded {
            KnowledgeProfile.isOnborded = true
            showOnboarding()
        }
    }
    
    func showOnboarding() {
        let model: OnboardingModuleModel = .init(
            onboardingModels: [
                .init(image: .onboarding3, flippedImage: .onboarding4, title: "To see the translation, tap on the card"),
                .init(image: .onboarding2, title: "Swipe the cards in different directions"),
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
                title: "Words111",
                transcription: "fqwefqwe",
                examples: ["Harper's words came faster now", "Tracy listened to his words, first with shock and then with growing anger. He made her sound like an outcast, a leper"],
                translations: ["kek"]),
            
            DailyWordsUserDefaults(title: "Interesting", transcription: "wefwef", examples: ["Интересный"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Words", transcription: nil, examples: ["Интересный"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Interesting message was sended in my pocket", transcription: nil, examples: ["Интересное сообщение было отправлено в моем кармане"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Joke", transcription: nil, examples: ["It was a joke, of course, Percy was happy, not in a serious grabbing mood at all, but Delacroix didn't know that"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "Silly", transcription: nil, examples: ["Глупый"], translations: ["kek"]),
            DailyWordsUserDefaults(title: "to get out", transcription: nil, examples: ["Suddenly I was terrified, almost choked with a need to get out of there", "Who told you to get out ?"], translations: ["kek"]),
        ]
        DailyWordsUserDefaultsCache.save(newDailyWords.shuffled())
    }
    
    private func mockFetchData() {
        if true || isNewDay() {
            DailyWordsUserDefaultsCache.remove()
            refillDailyWords()
        }
        
        var array = DailyWordsUserDefaultsCache.get()
        
        if array.isEmpty {
            refillDailyWords()
            array = DailyWordsUserDefaultsCache.get()
        }
        
        handleSuccess(array.map { DailyWordsViewController.ViewModel(title: $0.title, transcription: $0.transcription, subtitles: $0.examples, translations: $0.translations) })
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        view?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        view?.changeState(state: .error)
    }
    
}
