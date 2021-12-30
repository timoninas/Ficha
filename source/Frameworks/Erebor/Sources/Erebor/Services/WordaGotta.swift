//
//  WordaGotta.swift
//  
//
//  Created by Антон Тимонин on 27.12.2021.
//

import Foundation

public final class WordaGotta {
    
    public init() {}
    
    public func gottaAllWords() -> [BagOfGoldWords] {
        var totalArray: [BagOfGoldWords] = []
        
        totalArray += [
            getGoldArhitecture(),
            getGoldComputers(),
            getGoldEmotions(),
            getGoldHome(),
            getGoldAnimals(),
            getGoldJob(),
            getGoldClothes(),
            getGoldSerials(),
            getGoldSlang()
        ]
        
        return totalArray
    }
    
    public func gottaWordBy(_ type: ArkenstoneTypeWord) -> BagOfGoldWords {
        switch type {
        case .architecture:
            return getGoldArhitecture()
        case .computers:
            return getGoldComputers()
        case .emotions:
            return getGoldEmotions()
        case .home:
            return getGoldHome()
        case .animals:
            return getGoldAnimals()
        case .job:
            return getGoldJob()
        case .clothes:
            return getGoldClothes()
        case .serials:
            return getGoldSerials()
        case .slang:
            return getGoldSlang()
        case .favourite:
            return BagOfGoldWords.init(
                words: [],
                typeWord: .favourite,
                typeTranslation: .enToRu
            )
        case .unknown:
            return BagOfGoldWords.init(
                words: [],
                typeWord: .unknown,
                typeTranslation: .enToRu
            )
        }
        
    }
    
}
