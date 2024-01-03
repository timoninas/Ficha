//
//  LearnTimesModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import RevolvetraUserDefaults
import RevolvetraKnowledge
import SwiftUI
import Erebor

protocol LearnTimesModelProtocol {
    
    func fetchWords() -> [LearnTimesViewModel.Model]
    
    func isNeedToPresentOnboarding() -> Bool
}

final class LearnTimesModel: LearnTimesModelProtocol {
    
    private var wordsStorage: WordsStorageProtocol?
    
    init(wordsStorage: WordsStorageProtocol?) {
        self.wordsStorage = wordsStorage
    }
    
    func fetchWords() -> [LearnTimesViewModel.Model] {
        fetchData()
    }
    
    func isNeedToPresentOnboarding() -> Bool {
        if !KnowledgeProfile.isOnborded {
            KnowledgeProfile.isOnborded = true
            return true
        }
        return false
    }
    
    private func fetchData() -> [LearnTimesViewModel.Model] {
        DailyWordsUserDefaultsCache.remove()
        refillDailyWords()
        let array = DailyWordsUserDefaultsCache.get()
        
        return array.map { dailyWord in
            LearnTimesViewModel.Model(
                title: dailyWord.title,
                transcription: dailyWord.transcription,
                translations: dailyWord.translations,
                examples: dailyWord.examples,
                type: dailyWord.type,
                languageVersion: dailyWord.languageVersion,
                displayedCount: dailyWord.displayedCount)
        }
    }
    
    private func refillDailyWords() {
        var newDailyWords: [DailyWordsUserDefaults] = []
        let types = ArkenstoneTypeWord.allowedTypes()
        types
            .shuffled()
            .prefix(5)
            .forEach { type in
                let words = Array(MoriaManager.shared.getWordz(type: type)
                                    .shuffled()
                                    .prefix(3))
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
        let shuffledWords = newDailyWords.shuffled()
        fillStorages(shuffledWords)
    }
    
    private func fillStorages(_ words: [DailyWordsUserDefaults]) {
        DailyWordsUserDefaultsCache.save(words)
        wordsStorage?.reset()
        wordsStorage?.words = words.map {
            .init(title: $0.title,
                  translation: $0.translations.first ?? "")
        }
    }
}
