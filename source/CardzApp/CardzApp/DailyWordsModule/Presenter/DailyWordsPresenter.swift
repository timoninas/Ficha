//
//  DailyWordsPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation
import Erebor
import RevolvetraKnowledge
import RevolvetraUserDefaults

final class DailyWordsPresenter: DailyWordsOutput {
    
    weak var view: DailyWordsViewInput?
    
    init() {}
    
    func viewDidLoad() {
        fetchData()
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
    
    private func refillDailyWords() {
        var newDailyWords: [DailyWordsUserDefaults] = []
        let types = ArkenstoneTypeWord.allCases
        types
            .shuffled()
            .prefix(6)
            .forEach { type in
                guard type != .slang else { return }
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
                        languageVersion: word.languageVersion.rawValue,
                        displayedCount: word.displayedCount
                    ))
                }
            }
        DailyWordsUserDefaultsCache.save(newDailyWords.shuffled())
    }
    
    private func fetchData() {
        if DaysChechker.isNewDay {
            DailyWordsUserDefaultsCache.remove()
            refillDailyWords()
        }
        
        var array = DailyWordsUserDefaultsCache.get()
        
        if array.isEmpty {
            refillDailyWords()
            array = DailyWordsUserDefaultsCache.get()
            if array.isEmpty {
                refillDailyWords()
                array = DailyWordsUserDefaultsCache.get()
            }
        }
        
        handleSuccess(array.map { DailyWordsViewController.ViewModel(
            title: $0.title,
            transcription: $0.transcription,
            subtitles: $0.examples,
            translations: $0.translations,
            type: ArkenstoneTypeWord(rawValue: $0.type) ?? .unknown,
            languageVersion: SilverTypeTranslation(rawValue: $0.languageVersion) ?? .unknown,
            displayedCount: $0.displayedCount
        ) })
    }
    
    private func handleSuccess(_ todayCards: [DailyWordsViewController.ViewModel]) {
        view?.changeState(state: .content(todayCards))
    }
    
    private func handleFailure() {
        view?.changeState(state: .error)
    }
    
}
