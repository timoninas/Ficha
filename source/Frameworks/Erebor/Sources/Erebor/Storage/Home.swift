//
//  Home.swift
//  
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Foundation

func getGoldHome() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Aerial",
            transcription: "[ˈeərɪəl]",
            examples: ["The dynamo hummed softly and invisible magnetic waves left the aerial one after another",
                       "All because I wanted an aerial survey"],
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
            examples: ["Stan swiveled in his armchair, his hands on the back, the better to look at Harry",
                       "He's not an armchair philosopher",
                       "He's a little pedantic, but he's an armchair revolutionary."],
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
        .init(
            word: "Kitchen",
            transcription: "[ˈkɪʧɪn]",
            examples: ["You must have crockery and cutlery in your kitchen",
                       "Andre took a small black telephone book from a kitchen drawer, looked up a number, and dialed"],
            translations: ["Кухня"]
        ),
        .init(
            word: "Floor",
            transcription: "[flɔː]",
            examples: ["I'm on Floor 50",
                       "In their search for food chimpanzees move effortlessly between the forest floor and the canopy"],
            translations: ["Пол", "Этаж"]
        ),
        .init(
            word: "Basement",
            transcription: "[ˈbeɪsmənt]",
            examples: ["The air inside was bitter, like a basement in winter",
                       "They caught me making out with a girl in the basement and all hell broke loose",
                       "Next morning they rang through from the basement to say that Mr Fennell was on the telephone"],
            translations: ["Подвал"]
        ),
        .init(
            word: "Fan",
            transcription: "[fæn]",
            examples: ["Wipers, fan belts, gaskets?",
                       "Neither he nor Volka suspected that he had suddenly become a fan, too",
                       "I built a Footprints on the Moon fan page, Trent joined it"],
            translations: ["Вентилятор"]
        ),
        .init(
            word: "Screen",
            transcription: "[skriːn]",
            examples: ["The little church on a hill had the mossy greyness of a rock seen through a ragged screen of leaves",
                       "He stepped through the windows into the drawing room, but these days that necessitated opening a screen",
                       "A projection screen for the mind"],
            translations: ["Экран"]
        ),
        .init(
            word: "Flat apartment",
            transcription: "[flæt] [əˈpɑːtmənt]",
            examples: ["You've sent me three flats, a studio apartment and a haystack"],
            translations: ["Квартира"]
        ),
        .init(
            word: "Living",
            transcription: "[ˈlɪvɪŋ]",
            examples: ["But I couldn't love them if they were my chief reason for living",
                       "You keep all of his money, except provide living expenses"],
            translations: ["Проживание"]
        ),
        .init(
            word: "Key",
            transcription: "[kiː]",
            examples: ["I press a key... it sends compressed air into a particular pipe, producing sound waves",
                       "There should be a key pad right on the console of the station"],
            translations: ["Ключ"]
        ),
        .init(
            word: "Pool",
            transcription: "[puːl]",
            examples: ["The surface of the pool was shimmering like a moonlit pond",
                       "I am not the only person here who's peed in the pool",
                       "Until about midday the Pool of London was an astonishing scene"],
            translations: ["Бассейн"]
        ),
        .init(
            word: "Desk",
            transcription: "[dɛsk]",
            examples: ["Taking another hit of cognac, the senator stood up and walked unevenly to his desk",
                       "The knight sitting on Sauniere's desk!",
                       "Ask at the desk"],
            translations: ["Стол"]
        ),
        .init(
            word: "Visitor",
            transcription: "[ˈvɪzɪtə]",
            examples: ["Langdon still felt fuzzy. A visitor? His eyes focused now on a crumpled flyer on his bedside table",
                       "I'm a visitor here",
                       "You know I'm just a visitor"],
            translations: ["Посетитель"]
        ),
        .init(
            word: "Guest",
            transcription: "[gɛst]",
            examples: ["There was only one guest sitting at The Chalice",
                       "Did you see my brother when you were the Starks' guest?"],
            translations: ["Гость"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .home, typeTranslation: .enToRu)
    return bagOfGold
}
