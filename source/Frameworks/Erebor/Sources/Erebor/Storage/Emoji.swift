//
//  Emoji.swift
//  
//
//  Created by Антон Тимонин on 30.01.2022.
//

import Foundation

func getGoldEmoji() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "🐶",
            transcription: "Dog",
            examples: [
                ""
            ],
            translations: ["Собака"]
        ),
        .init(
            word: "🐭",
            transcription: "Mouse",
            examples: [
                ""
            ],
            translations: ["Мышь"]
        ),
        .init(
            word: "🦊",
            transcription: "Fox",
            examples: [
                ""
            ],
            translations: ["Лиса"]
        ),
        .init(
            word: "🐻",
            transcription: "Bear",
            examples: [
                ""
            ],
            translations: ["Медведь"]
        ),
        .init(
            word: "🐼",
            transcription: "Panda",
            examples: [
                ""
            ],
            translations: ["Панда"]
        ),
        .init(
            word: "🐧",
            transcription: "Penguin",
            examples: [
                ""
            ],
            translations: ["Пингвин"]
        ),
        .init(
            word: "🐤",
            transcription: "Chicken",
            examples: [
                ""
            ],
            translations: ["Цыпленок"]
        ),
        .init(
            word: "🐸",
            transcription: "Frog",
            examples: [
                ""
            ],
            translations: ["Лягушка"]
        ),
        .init(
            word: "🐷",
            transcription: "Pig",
            examples: [
                ""
            ],
            translations: ["Свинья"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .animals, typeTranslation: .enToRu)
    return bagOfGold
}

