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
        .init(
            word: "Box office",
            transcription: "",
            examples: [],
            translations: ["Касса"]
        ),
        .init(
            word: "Cameraman",
            transcription: "",
            examples: [],
            translations: ["Оператор"]
        ),
        .init(
            word: "Caption",
            transcription: "",
            examples: [],
            translations: ["Титр"]
        ),
        .init(
            word: "Cartoon",
            transcription: "",
            examples: [],
            translations: ["Мультфильм"]
        ),
        .init(
            word: "Cast",
            transcription: "",
            examples: [],
            translations: ["Актерский состав"]
        ),
        .init(
            word: "Character",
            transcription: "",
            examples: [],
            translations: ["Персонаж"]
        ),
        .init(
            word: "Cinema",
            transcription: "",
            examples: [],
            translations: ["Кино"]
        ),
        .init(
            word: "Movie theater",
            transcription: "",
            examples: [],
            translations: ["Театр"]
        ),
        .init(
            word: "Clapper",
            transcription: "",
            examples: [],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Clapboard",
            transcription: "",
            examples: [],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Clapperboard",
            transcription: "",
            examples: [],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Slate",
            transcription: "",
            examples: [],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Close-up",
            transcription: "",
            examples: [],
            translations: ["Крупный план"]
        ),
        .init(
            word: "Colour film",
            transcription: "",
            examples: [],
            translations: ["Цветной фильм"]
        ),
        .init(
            word: "Comedy",
            transcription: "",
            examples: [],
            translations: ["Комедия"]
        ),
        .init(
            word: "Costume designer",
            transcription: "",
            examples: [],
            translations: ["Дизайнер по костюмам"]
        ),
        .init(
            word: "Crew",
            transcription: "",
            examples: [],
            translations: ["Съемочная группа"]
        ),
        .init(
            word: "Crime film",
            transcription: "",
            examples: [],
            translations: ["Детектив"]
        ),
        .init(
            word: "Hobbit",
            transcription: " [ˈhɒbɪt]",
            examples: [],
            translations: ["Хоббит"]
        ),
        .init(
            word: "Director",
            transcription: "[dɪˈrektə]",
            examples: ["The agent frowned. \"It's the director of our Cryptology Department\"",
                       "Gabrielle scanned the crowd, but did not see anyone who looked like PODS mission director Chris Harper",
                       "Assistant art director on \"Rage\""],
            translations: ["Режиссер"]
        ),
        .init(
            word: "Drama",
            transcription: "[ˈdrɑːmə]",
            examples: ["From the cockpit of the idling Kiowa, Delta-One watched the drama unfold before him",
                       "Now Mrs. Hubbard, let me say, played the most important part in the drama",
                       "I was aware that Mr. Wopsle had not succeeded in reviving the Drama, but, on the contrary, had rather partaken of its decline"],
            translations: ["Драма"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .serials, typeTranslation: .enToRu)
    return bagOfGold
}
