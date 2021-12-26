//
//  Emotions.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

public func getGoldEmotions() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Joy",
            transcription: "",
            examples: [],
            translations: ["Радость"]
        ),
        .init(
            word: "Delight",
            transcription: "",
            examples: [],
            translations: ["Восхищение", "Удовольствие"]
        ),
        .init(
            word: "Gaiety",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Радость", "Пышное украшение"]
        ),
        .init(
            word: "Merrymaking",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Потеха"]
        ),
        .init(
            word: "Merriment",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Развлечение"]
        ),
        .init(
            word: "Mirth",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Радость"]
        ),
        .init(
            word: "Fun",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Забава"]
        ),
        .init(
            word: "Gratification",
            transcription: "",
            examples: [],
            translations: ["Удовольствие", "Наслаждение"]
        ),
        .init(
            word: "Enjoyment",
            transcription: "",
            examples: [],
            translations: ["Наслаждение", "Удовольствие"]
        ),
        .init(
            word: "Pleasure",
            transcription: "",
            examples: [],
            translations: ["Удовольствие"]
        ),
        .init(
            word: "Delectation",
            transcription: "",
            examples: [],
            translations: ["Наслаждение", "Удовольствие"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
