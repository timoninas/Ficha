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
            word: "",
            transcription: "",
            examples: [],
            translations: []
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
