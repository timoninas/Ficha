//
//  Job.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldJob() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Case",
            transcription: "[keɪs]",
            examples: [],
            translations: ["Дело"]
        ),
        .init(
            word: "Company",
            transcription: "[ˈkʌmpəni]",
            examples: [],
            translations: ["Компания"]
        ),
        .init(
            word: "Work",
            transcription: "[wɜːk]",
            examples: [],
            translations: ["Работа"]
        ),
        .init(
            word: "Money",
            transcription: "[ˈmʌni]",
            examples: [],
            translations: ["Деньги"]
        ),
        .init(
            word: "Job",
            transcription: "[ʤɒb]",
            examples: [],
            translations: ["Работа"]
        ),
        .init(
            word: "Service",
            transcription: "[ˈsɜːvɪs]",
            examples: [],
            translations: ["Услуга", "Обслуживание"]
        ),
        .init(
            word: "Office",
            transcription: "[ˈɒfɪs]",
            examples: [],
            translations: ["Офис"]
        ),
        .init(
            word: "Policy",
            transcription: "[ˈpɒlɪsi]",
            examples: [],
            translations: ["Политика"]
        ),
        .init(
            word: "Plan",
            transcription: "[plæn]",
            examples: [],
            translations: ["План"]
        ),
        .init(
            word: "Control",
            transcription: "[kənˈtrəʊl]",
            examples: [],
            translations: ["Контроль"]
        ),
        .init(
            word: "Report",
            transcription: "[rɪˈpɔːt]",
            examples: [],
            translations: ["Отчет", "Доклад"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
