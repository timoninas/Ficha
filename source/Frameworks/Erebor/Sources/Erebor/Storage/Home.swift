//
//  Home.swift
//  
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation

public func getGoldHome() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Aerial",
            transcription: "[ˈeərɪəl]",
            examples: [],
            translations: ["Антенна"]
        ),
        .init(
            word: "Apartment",
            transcription: "[əˈpɑːtmənt]",
            examples: [],
            translations: ["Квартира", "Апартамент"]
        ),
        .init(
            word: "Armchair",
            transcription: "[ˈɑːmˌtʃeər]",
            examples: [],
            translations: ["Кресло", "Кабинетный"]
        ),
        .init(
            word: "Balcony",
            transcription: "[ˈbælkənɪ]",
            examples: [],
            translations: ["Балкон"]
        ),
        .init(
            word: "Barn",
            transcription: "[bɑːn]",
            examples: [],
            translations: ["Сарай", "Фмбар"]
        ),
        .init(
            word: "Basement",
            transcription: "[ˈbeɪsmənt]",
            examples: [],
            translations: ["Подвал", "Цокольный этаж", "Фундамент"]
        ),
        .init(
            word: "Bath",
            transcription: "[bɑːθ]",
            examples: [],
            translations: ["Ванна", "Баня", "Купание"]
        ),
        .init(
            word: "Bathroom",
            transcription: "[ˈbɑːθruːm]",
            examples: [],
            translations: ["Ванная комната", "Туалет"]
        ),
        .init(
            word: "Bed",
            transcription: "[bed]",
            examples: [],
            translations: ["Постель", "Кровать"]
        ),
        .init(
            word: "Bedclothes",
            transcription: "[ˈbedkləʊðz]",
            examples: [],
            translations: ["Постельное белье"]
        ),
        .init(
            word: "Bedroom",
            transcription: "[ˈbedruːm]",
            examples: [],
            translations: ["Спальня"]
        ),
        .init(
            word: "Bedside",
            transcription: "[ˈbedsaɪd]",
            examples: [],
            translations: ["Прикроватный"]
        ),
        .init(
            word: "Bookcase",
            transcription: "[ˈbʊkkeɪs]",
            examples: [],
            translations: ["Книжный шкаф"]
        ),
        .init(
            word: "Carpet",
            transcription: "[ˈkɑːpɪt]",
            examples: [],
            translations: ["Ковер", "Покрытие"]
        ),
        .init(
            word: "Ceiling",
            transcription: "[ˈsiːlɪŋ]",
            examples: [],
            translations: ["Потолок", "Перекрытие"]
        ),
        .init(
            word: "Chair",
            transcription: "[tʃeər]",
            examples: [],
            translations: ["Стул", "Кресло", "Кафедра"]
        ),
        .init(
            word: "Chimney",
            transcription: "[ˈtʃɪmnɪ]",
            examples: [],
            translations: ["Дымоход", "Камин"]
        ),
        .init(
            word: "Cottage",
            transcription: "[kaʊtʃ]",
            examples: [],
            translations: ["Диван", "Кушетка"]
        ),
        .init(
            word: "Cup",
            transcription: "[kʌp]",
            examples: [],
            translations: ["Чашка", "Кубок"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
