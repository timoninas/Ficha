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
            examples: [],
            translations: ["Собака"]
        ),
        .init(
            word: "🐭",
            transcription: "Mouse",
            examples: [],
            translations: ["Мышь"]
        ),
        .init(
            word: "🦊",
            transcription: "Fox",
            examples: [],
            translations: ["Лиса"]
        ),
        .init(
            word: "🐻",
            transcription: "Bear",
            examples: [],
            translations: ["Медведь"]
        ),
        .init(
            word: "🐼",
            transcription: "Panda",
            examples: [],
            translations: ["Панда"]
        ),
        .init(
            word: "🐧",
            transcription: "Penguin",
            examples: [],
            translations: ["Пингвин"]
        ),
        .init(
            word: "🐤",
            transcription: "Chicken",
            examples: [],
            translations: ["Цыпленок"]
        ),
        .init(
            word: "🐸",
            transcription: "Frog",
            examples: [],
            translations: ["Лягушка"]
        ),
        .init(
            word: "🐷",
            transcription: "Pig",
            examples: [],
            translations: ["Свинья"]
        ),
        .init(
            word: "🐵",
            transcription: "A monkey",
            examples: [],
            translations: ["Обезьяна"]
        ),
        .init(
            word: "🦆",
            transcription: "Duck",
            examples: [],
            translations: ["Утка"]
        ),
        .init(
            word: "🦉",
            transcription: "Owl",
            examples: [],
            translations: ["Сова"]
        ),
        .init(
            word: "🦅",
            transcription: "Eagle",
            examples: [],
            translations: ["Орёл"]
        ),
        .init(
            word: "🐯",
            transcription: "Tiger",
            examples: [],
            translations: ["Тигр"]
        ),
        .init(
            word: "🦄",
            transcription: "Unicorn",
            examples: [],
            translations: ["Единорог"]
        ),
        .init(
            word: "🐗",
            transcription: "Boar",
            examples: [],
            translations: ["Боров"]
        ),
        .init(
            word: "🐴",
            transcription: "Horse",
            examples: [],
            translations: ["Лошадь"]
        ),
        .init(
            word: "🐢",
            transcription: "Turtle",
            examples: [],
            translations: ["Черепаха"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .animals, typeTranslation: .enToRu)
    return bagOfGold
}

