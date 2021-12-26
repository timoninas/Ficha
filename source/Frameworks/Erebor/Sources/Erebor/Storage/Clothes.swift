//
//  Clothes.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

public func getGoldClothes() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "shirt",
            transcription: "",
            examples: [],
            translations: ["рубашка"]
        ),
        .init(
            word: "T-shirt",
            transcription: "",
            examples: [],
            translations: ["футболка"]
        ),
        .init(
            word: "polo shirt",
            transcription: "",
            examples: [],
            translations: ["рубашка поло"]
        ),
        .init(
            word: "fitted shirt",
            transcription: "",
            examples: [],
            translations: ["приталенная рубашка"]
        ),
        .init(
            word: "loose-fitting shirt",
            transcription: "",
            examples: [],
            translations: ["рубашка свободного покроя"]
        ),
        .init(
            word: "cuff",
            transcription: "",
            examples: [],
            translations: ["манжета"]
        ),
        .init(
            word: "button",
            transcription: "",
            examples: [],
            translations: ["пуговица"]
        ),
        .init(
            word: "pocket",
            transcription: "",
            examples: [],
            translations: ["карман"]
        ),
        .init(
            word: "breast pocket",
            transcription: "",
            examples: [],
            translations: ["нагрудный карман"]
        ),
        .init(
            word: "blouse",
            transcription: "",
            examples: [],
            translations: ["блузка"]
        ),
        .init(
            word: "tunic",
            transcription: "",
            examples: [],
            translations: ["туника"]
        ),
        .init(
            word: "turtleneck",
            transcription: "",
            examples: [],
            translations: ["водолазка"]
        ),
        .init(
            word: "jacket",
            transcription: "",
            examples: [],
            translations: ["куртка", "жакет"]
        ),
        .init(
            word: "casual jacket",
            transcription: "",
            examples: [],
            translations: ["повседневная куртка"]
        ),
        .init(
            word: "leather jacket",
            transcription: "",
            examples: [],
            translations: ["кожаная куртка"]
        ),
        .init(
            word: "dinner jacket",
            transcription: "",
            examples: [],
            translations: ["смокинг"]
        ),
        .init(
            word: "hooded jacket",
            transcription: "",
            examples: [],
            translations: ["куртка с капюшоном"]
        ),
        .init(
            word: "flak jacket",
            transcription: "",
            examples: [],
            translations: ["бронежилет"]
        ),
        .init(
            word: "life jacket",
            transcription: "",
            examples: [],
            translations: ["спасательный жилет"]
        ),
        .init(
            word: "skirt",
            transcription: "",
            examples: [],
            translations: ["юбка"]
        ),
        .init(
            word: "miniskirt",
            transcription: "",
            examples: [],
            translations: ["мини-юбка"]
        ),
        .init(
            word: "knee-length skirt",
            transcription: "",
            examples: [],
            translations: ["юбка до колена"]
        ),
        .init(
            word: "calf-length skirt",
            transcription: "",
            examples: [],
            translations: ["юбка ниже колена"]
        ),
        .init(
            word: "multi-colored skirt",
            transcription: "",
            examples: [],
            translations: ["разноцветная юбка"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
