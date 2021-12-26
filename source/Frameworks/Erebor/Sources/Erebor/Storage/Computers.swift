//
//  Computers.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

public func getGoldComputers() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Ability",
            transcription: "",
            examples: [],
            translations: ["Способность", "Возможность"]
        ),
        .init(
            word: "Accurate",
            transcription: "",
            examples: [],
            translations: ["Точный"]
        ),
        .init(
            word: "To affect",
            transcription: "",
            examples: [],
            translations: ["Воздействовать"]
        ),
        .init(
            word: "Amount of data",
            transcription: "",
            examples: [],
            translations: ["Объем данных"]
        ),
        .init(
            word: "Approximately",
            transcription: "",
            examples: [],
            translations: ["Приблизительно"]
        ),
        .init(
            word: "To attain",
            transcription: "",
            examples: [],
            translations: ["Достигать"]
        ),
        .init(
            word: "Available",
            transcription: "",
            examples: [],
            translations: ["Доступный"]
        ),
        .init(
            word: "Broadband connection",
            transcription: "",
            examples: [],
            translations: ["Выделенное подключение"]
        ),
        .init(
            word: "To browse",
            transcription: "",
            examples: [],
            translations: ["Просматривать"]
        ),
        .init(
            word: "Browser",
            transcription: "",
            examples: [],
            translations: ["Браузер", "Окно просмотра"]
        ),
        .init(
            word: "To carry out",
            transcription: "",
            examples: [],
            translations: ["Выполнять"]
        ),
        .init(
            word: "Computer desk",
            transcription: "",
            examples: [],
            translations: ["Компьютерный стол"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
