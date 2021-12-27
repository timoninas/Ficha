//
//  Serials.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldSerials() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Action!",
            transcription: "",
            examples: [],
            translations: ["Мотор!"]
        ),
        .init(
            word: "Action movie",
            transcription: "",
            examples: [],
            translations: ["Боевик"]
        ),
        .init(
            word: "Actor",
            transcription: "",
            examples: [],
            translations: ["Актер"]
        ),
        .init(
            word: "Actress",
            transcription: "",
            examples: [],
            translations: ["Актриса"]
        ),
        .init(
            word: "Adventure film",
            transcription: "",
            examples: [],
            translations: ["Приключенческий фильм"]
        ),
        .init(
            word: "Alias",
            transcription: "",
            examples: [],
            translations: ["Вымышленное имя"]
        ),
        .init(
            word: "Animator",
            transcription: "",
            examples: [],
            translations: ["Аниматор"]
        ),
        .init(
            word: "Aspect ratio",
            transcription: "",
            examples: [],
            translations: ["Соотношение сторон", "Формат"]
        ),
        .init(
            word: "Backstage",
            transcription: "",
            examples: [],
            translations: ["За кулисами"]
        ),
        .init(
            word: "Behind the scenes",
            transcription: "",
            examples: [],
            translations: ["За кулисами"]
        ),
        .init(
            word: "Black-and-white film",
            transcription: "",
            examples: [],
            translations: ["Черно-белый фильм"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
