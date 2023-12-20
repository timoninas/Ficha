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
    
    func fetchWords() -> [LearnTimesViewModel.LearnWordsViewModel]
    
    func isNeedToPresentOnboarding() -> Bool
    
}

final class LearnTimesModel: LearnTimesModelProtocol {
    
    func fetchWords() -> [LearnTimesViewModel.LearnWordsViewModel] {
        fetchData()
    }
    
    func isNeedToPresentOnboarding() -> Bool {
        if !KnowledgeProfile.isOnborded {
            KnowledgeProfile.isOnborded = true
            return true
        }
        return false
    }
    
    private func fetchData() -> [LearnTimesViewModel.LearnWordsViewModel] {
        if DaysChechker.isNewDay {
            DailyWordsUserDefaultsCache.remove()
            refillDailyWords()
        }
        
        var array = DailyWordsUserDefaultsCache.get()
        
        for _ in 0..<2 {
            guard array.isEmpty else { break }
            refillDailyWords()
            array = DailyWordsUserDefaultsCache.get()
        }
        
        return array.map { dailyWord in
            LearnTimesViewModel.LearnWordsViewModel(
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
        DailyWordsUserDefaultsCache.save(newDailyWords.shuffled())
    }
    
}


final class MockLearnTimesModel: LearnTimesModelProtocol {
    
    func fetchWords() -> [LearnTimesViewModel.LearnWordsViewModel] {
        [
            LearnTimesViewModel.LearnWordsViewModel(title: "1123", transcription: "[awefawe]", examples: ["Lol", "Kek", "Cheburek"], languageVersion: "", displayedCount: 0),
            LearnTimesViewModel.LearnWordsViewModel(title: "rejkngjkwegjkner", transcription: "[o0o]", examples: [], languageVersion: "", displayedCount: 0),
            LearnTimesViewModel.LearnWordsViewModel(title: "Ololoolo", transcription: "[123]", examples: ["", "", ""], languageVersion: "", displayedCount: 0)
        ]
    }
    
    func isNeedToPresentOnboarding() -> Bool {
        false
    }
    
}
