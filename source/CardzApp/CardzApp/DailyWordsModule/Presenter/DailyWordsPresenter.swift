//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation
import RevoletraUserDefaultsKeys
import RevolvetraKnowledge

final class DailyWordsPresenter: DailyWordsOutput {
    
    weak var input: DailyWordsViewInput?
    
    init() { }
    
    func viewDidLoad() {
        self.mockFetchData()
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
        DailyWordsUserDefaultsCache.save([
            DailyWordsUserDefaults(title: "Words", examples: ["Harper's words came faster now", "Tracy listened to his words, first with shock and then with growing anger. He made her sound like an outcast, a leper"]),
            
            DailyWordsUserDefaults(title: "Interesting", examples: ["Интересный"]),
            DailyWordsUserDefaults(title: "Words", examples: ["Интересный"]),
            DailyWordsUserDefaults(title: "Interesting message was sended in my pocket", examples: ["Интересное сообщение было отправлено в моем кармане"]),
            DailyWordsUserDefaults(title: "Joke", examples: ["It was a joke, of course, Percy was happy, not in a serious grabbing mood at all, but Delacroix didn't know that"]),
            DailyWordsUserDefaults(title: "Silly", examples: ["Глупый"]),
            DailyWordsUserDefaults(title: "to get out", examples: ["Suddenly I was terrified, almost choked with a need to get out of there", "Who told you to get out ?"]),
        ])
        
    }
    
    private func mockFetchData() {
        if isNewDay() {
            DailyWordsUserDefaultsCache.remove()
            refillDailyWords()
        }
        
        let array = DailyWordsUserDefaultsCache.get()
        handleSuccess(array.map { DailyWordsViewController.ViewModel(title: $0.title, subtitles: $0.examples, translations: []) })
        
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        self.input?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        self.input?.changeState(state: .error)
    }
    
}

struct DailyWordsUserDefaultsCache {
    static let key = "userProfileCache"
    static func save(_ value: [DailyWordsUserDefaults]) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> [DailyWordsUserDefaults] {
        var dailyWords: [DailyWordsUserDefaults] = []
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            guard let words = try? PropertyListDecoder().decode([DailyWordsUserDefaults].self, from: data) else { return [] }
            return words
        } else {
            return dailyWords
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
