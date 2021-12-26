//
//  Animals.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

public func getGoldAnimals() -> BagOfGoldWords {
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
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
