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
            examples: [
                "It's the most beautiful story ever told - next to that of Mickey and Minnie Mouse",
                "Mouse savior?",
                "He sat easily, carelessly but she felt that he was watching her as alertly as a cat watches a mouse hole"
            ],
            translations: ["Мышь"]
        ),
        .init(
            word: "Deer",
            transcription: "[diə]",
            examples: [
                "There were even more upstairs, with deer inside them drinking at water holes, and birds flying south for the winter",
                "The train was passing through the forest of Saint Germaine, and she had seen a frightened deer clear one of the paths at a bound",
                "Yes, it was very sad when the guy stopped drawing the deer"
            ],
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
            examples: [
                "She has a necklace of cornelian beads and one of bright royal blue beads and is wearing a brooch with a pearl butterfly on it",
                "Honey, would you feel better... if I went out and gave that butterfly valve a twist now?",
                "Her movements were as light and airy as those of a butterfly"
            ],
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
            examples: [
                "'For God's sake,' David protested to Kate. \"I feel like a damned peacock\"",
                "He admired the indescribably turquoise neck of the peacock, the metre-wide spread of its tail and its pink and gold fringe",
                "(as) proud as a peacock"
            ],
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
            examples: [
                "Hams in wine, pressed duck, pate de foie gras, rare fruits in and out of season, were spread in profusion",
                "She went, like a lame duck, back through the long corridors; she stumbled over the familiar tiger skins in the dark hall",
                "Things just roll off you like water off a duck"
            ],
            translations: ["Утка"]
        ),
        .init(
            word: "Penguin",
            transcription: "['peŋgwin]",
            examples: [
                "Penguin or beaver?",
                "Pass me the telephone, Penguin",
                "A penguin with a sunburn"
            ],
            translations: ["Пингвин"]
        ),
        .init(
            word: "Swan",
            transcription: "[swɔn]",
            examples: [
                "I wouldn't have gone without you, and then I might never have seen that-that swan, that sunbeam, that thunderbolt!",
                "You remember Swan, don't you?",
                "The Black Swan is an inn of repute in the High Street, at no distance from the station, and there we found the young lady waiting for us"
            ],
            translations: ["Лебедь"]
        ),
        .init(
            word: "Fish",
            transcription: "[fiʃ]",
            examples: [
                "He wants the big fish",
                "The rooming house where Mallory lived was a dilapidated brownstone in an unlighted street that smelled of a fish market",
                "He was looking at Robert Jordan with his mouth closed so that his lips made a tight line, like the mouth of a fish, Robert Jordan thought"
            ],
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
            translations: ["Щегол"]
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
