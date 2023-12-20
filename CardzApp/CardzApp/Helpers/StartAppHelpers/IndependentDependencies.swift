//
//  IndependentDependencies.swift
//  CardzApp
//
//  Created by Антон Тимонин on 06/02/2022.
//

import Erebor
import RevolvetraKnowledge
import RevolvetraUserDefaults
import EyeOfSauron
import WidgetKit

protocol IndependentDependenciesProtocol {
    
    /// Runs and installs all independent dependencies that need to be run/check and installed if necessary.
    func launch()
    
}

public final class IndependentDependencies: IndependentDependenciesProtocol {
    
    public static var shared = IndependentDependencies()
    
    private init() {}
    
    func launch() {
        setupLogger()
        fillDataBaseIfNeeded()
        refillWidgetWords()
    }
    
    private func setupLogger() {
        Logger.shared.add(ConsoleLogger())
        Logger.shared.add(OSLogger())
    }
    
    private func fillDataBaseIfNeeded() {
        if KnowledgeDevice.previousAppVersion.isEmpty
            || KnowledgeDevice.previousAppVersion != KnowledgeDevice.appVersion {
            KnowledgeDevice.previousAppVersion = (KnowledgeDevice.appVersion ?? "")
            MoriaManager.shared.deleteAllWordz(except: [.favourite])
            
            let wordaGotta = WordaGotta()
            wordaGotta.gottaAllWords().forEach { bagOfGoldWords in
                bagOfGoldWords.words.forEach { word in
                    MoriaManager.shared.addWordz(
                        wordz: word.word,
                        transcription: word.transcription,
                        examples: word.examples,
                        translations: word.translations,
                        type: bagOfGoldWords.typeWord,
                        languageVersion: bagOfGoldWords.typeTranslation
                    )
                }
            }
        }
        
    }
    
    private func refillWidgetWords() {
        let filling = {
            var newDailyWords: [DailyWordsUserDefaults] = []
            let types = ArkenstoneTypeWord.allowedTypes()
            types
                .shuffled()
                .prefix(6)
                .forEach { type in
                    let words = Array(MoriaManager.shared.getWordz(type: type)
                                        .filter({ $0.wordz.count < 12 })
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
            WidgetWordsUserDefaultsCache.save(newDailyWords.shuffled())
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        let extraFilling = {
            if WidgetWordsUserDefaultsCache.get().isEmpty {
                filling()
            }
        }
        guard true || DaysChechker.isQuarterOfDay else {
            extraFilling()
            return
        }
        filling()
        extraFilling()
    }
    
}
