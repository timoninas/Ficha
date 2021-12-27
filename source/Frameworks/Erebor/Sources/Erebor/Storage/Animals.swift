//
//  Animals.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldAnimals() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Stork",
            transcription: "[stɔːk]",
            examples: [],
            translations: ["Аист"]
        ),
        .init(
            word: "Shark",
            transcription: "[ʃɑːk]",
            examples: [],
            translations: ["Акула"]
        ),
        .init(
            word: "Antelope",
            transcription: "[ˈæntɪləʊp]",
            examples: [],
            translations: ["Антилопа"]
        ),
        .init(
            word: "Butterfly",
            transcription: "[ˈbʌtəflaɪ]",
            examples: [],
            translations: ["Бабочка"]
        ),
        .init(
            word: "Ox",
            transcription: "[ɒks]",
            examples: [],
            translations: ["Вол", "Бык"]
        ),
        .init(
            word: "Ram",
            transcription: "[ræm]",
            examples: [],
            translations: ["Баран"]
        ),
        .init(
            word: "Badger",
            transcription: "[ˈbædʒə]",
            examples: [],
            translations: ["Барсук"]
        ),
        .init(
            word: "Squirrel",
            transcription: "[ˈskwɪrəl]",
            examples: [],
            translations: ["Белка"]
        ),
        .init(
            word: "Polar bear",
            transcription: "[ˈpəʊlə beə]",
            examples: [],
            translations: ["Белый медведь"]
        ),
        .init(
            word: "Ladybird",
            transcription: "[ˈleɪdɪbɜːd]",
            examples: [],
            translations: ["Божья коровка"]
        ),
        .init(
            word: "Beaver",
            transcription: "[ˈbiːvə]",
            examples: [],
            translations: ["Бобр"]
        ),
        .init(
            word: "Bull",
            transcription: "[bʊl]",
            examples: [],
            translations: ["Бык"]
        ),
        .init(
            word: "Mouse",
            transcription: "[maus]",
            examples: [],
            translations: ["Мышь"]
        ),
        .init(
            word: "Deer",
            transcription: "[diə]",
            examples: [],
            translations: ["Олень"]
        ),
        .init(
            word: "Lion",
            transcription: "['laiən]",
            examples: [],
            translations: ["Лев"]
        ),
        .init(
            word: "Butterfly",
            transcription: "['bʌtəflai]",
            examples: [],
            translations: ["Бабочка"]
        ),
        .init(
            word: "Hippopotamus",
            transcription: "[,haipə'pɔtəməs]",
            examples: [],
            translations: ["Бегемот"]
        ),
        .init(
            word: "Rhinoceros",
            transcription: "[rai'nɔsərəs]",
            examples: [],
            translations: ["Носорог"]
        ),
        .init(
            word: "Snail",
            transcription: "[sneil]",
            examples: [],
            translations: ["Улитка"]
        ),
        .init(
            word: "Crocodile",
            transcription: "['krɔkədail]",
            examples: [],
            translations: ["Крокодил"]
        ),
        .init(
            word: "Cockroach",
            transcription: "['kɔkrəuʧ]",
            examples: [],
            translations: ["Таракан"]
        ),
        .init(
            word: "Cheetah",
            transcription: "['ʧi:tə]",
            examples: [],
            translations: ["Гепард"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
