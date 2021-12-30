//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation

import Erebor

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
        var newDailyWords: [DailyWordsUserDefaults] = []
        let types = ArkenstoneTypeWord.allCases
        types
            .shuffled()
            .prefix(6)
            .forEach { type in
                let words = Array(MoriaManager.shared.getWordz(type: type)
                                    .shuffled()
                                    .prefix(2))
                words.forEach { word in
                    newDailyWords.append(.init(
                        title: word.wordz,
                        transcription: word.transcription,
                        examples: word.examples,
                        translations: word.translations,
                        type: type.rawValue,
                        languageVersion: word.languageVersion.rawValue
                    ))
                }
            }
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
        
        handleSuccess(array.map { DailyWordsViewController.ViewModel(
            title: $0.title,
            transcription: $0.transcription,
            subtitles: $0.examples,
            translations: $0.translations,
            type: ArkenstoneTypeWord(rawValue: $0.type) ?? .unknown,
            languageVersion: SilverTypeTranslation(rawValue: $0.languageVersion) ?? .unknown
        ) })
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        view?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        view?.changeState(state: .error)
    }
    
}
