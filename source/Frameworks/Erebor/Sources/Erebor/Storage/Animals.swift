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
        .init(
            word: "Peacock",
            transcription: "['pi:kɔk]",
            examples: [],
            translations: ["Павлин"]
        ),
        .init(
            word: "Parrot",
            transcription: "['pærət]",
            examples: [],
            translations: ["Попугай"]
        ),
        .init(
            word: "Duck",
            transcription: "[dʌk]",
            examples: [],
            translations: ["Утка"]
        ),
        .init(
            word: "Penguin",
            transcription: "['peŋgwin]",
            examples: [],
            translations: ["Пингвин"]
        ),
        .init(
            word: "Swan",
            transcription: "[swɔn]",
            examples: [],
            translations: ["Лебедь"]
        ),
        .init(
            word: "Fish",
            transcription: "[fiʃ]",
            examples: [],
            translations: ["Рыба"]
        ),
        .init(
            word: "Puppy",
            transcription: "['pʌpi]",
            examples: [],
            translations: ["Щенок"]
        ),
        .init(
            word: "Tortoise",
            transcription: "['tɔ:təs]",
            examples: [],
            translations: ["Черепаха"]
        ),
        .init(
            word: "Goldfinch",
            transcription: "['gəʋldfɪntʃ]",
            examples: [],
            translations: ["щегол"]
        ),
        .init(
            word: "Dolphin",
            transcription: "['dɔlfin]",
            examples: [],
            translations: ["Дельфин"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .animals, typeTranslation: .enToRu)
    return bagOfGold
}
