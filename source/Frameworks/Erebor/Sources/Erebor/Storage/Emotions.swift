//
//  Emotions.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldEmotions() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Joy",
            transcription: "",
            examples: [],
            translations: ["Радость"]
        ),
        .init(
            word: "Delight",
            transcription: "",
            examples: [],
            translations: ["Восхищение", "Удовольствие"]
        ),
        .init(
            word: "Gaiety",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Радость", "Пышное украшение"]
        ),
        .init(
            word: "Merrymaking",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Потеха"]
        ),
        .init(
            word: "Merriment",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Развлечение"]
        ),
        .init(
            word: "Mirth",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Радость"]
        ),
        .init(
            word: "Fun",
            transcription: "",
            examples: [],
            translations: ["Веселье", "Забава"]
        ),
        .init(
            word: "Gratification",
            transcription: "",
            examples: [],
            translations: ["Удовольствие", "Наслаждение"]
        ),
        .init(
            word: "Enjoyment",
            transcription: "",
            examples: [],
            translations: ["Наслаждение", "Удовольствие"]
        ),
        .init(
            word: "Pleasure",
            transcription: "",
            examples: [],
            translations: ["Удовольствие"]
        ),
        .init(
            word: "Delectation",
            transcription: "",
            examples: [],
            translations: ["Наслаждение", "Удовольствие"]
        ),
        .init(
            word: "Buzz",
            transcription: "[bʌz]",
            examples: [],
            translations: ["Сильное чувство удовольствия"]
        ),
        .init(
            word: "Effervescent",
            transcription: "[ˌefərˈvesnt]",
            examples: [],
            translations: ["Возбужденное", "Восторженное поведение людей"]
        ),
        .init(
            word: "Electric",
            transcription: "[ɪˈlektrɪk]",
            examples: [],
            translations: ["Волнующий", "Поразительный"]
        ),
        .init(
            word: "Electrify",
            transcription: "[ɪˈlektrɪfaɪ]",
            examples: [],
            translations: ["Наэлектризовать"]
        ),
        .init(
            word: "Enthuse",
            transcription: "[ɪnˈθjuːz]",
            examples: [],
            translations: ["Воодушевлять"]
        ),
        .init(
            word: "Excitable",
            transcription: "[ɪkˈsaɪtəbl]",
            examples: [],
            translations: ["Легковозбудимый"]
        ),
        .init(
            word: "Excite",
            transcription: "[ɪkˈsaɪt]",
            examples: [],
            translations: ["Взволновать"]
        ),
        .init(
            word: "Excitement",
            transcription: "[ɪkˈsaɪtmənt]",
            examples: [],
            translations: ["Волнение"]
        ),
        .init(
            word: "Exult",
            transcription: "[ɪɡˈzʌlt]",
            examples: [],
            translations: ["Ликовать"]
        ),
        .init(
            word: "Fire",
            transcription: "[ˈfaɪər]",
            examples: [],
            translations: ["Разжигать (заставить кого-то чувствовать себя очень взволнованным)"]
        ),
        .init(
            word: "Flush",
            transcription: "[flʌʃ]",
            examples: [],
            translations: ["Румянец"]
        ),
        .init(
            word: "Galvanize",
            transcription: "[ˈɡælvənaɪz]",
            examples: [],
            translations: ["Возбуждать"]
        ),
        .init(
            word: "Het up",
            transcription: "[ˌhet ˈʌp]",
            examples: [],
            translations: ["Возмущенный"]
        ),
        .init(
            word: "Thrill",
            transcription: "[θrɪl]",
            examples: [],
            translations: ["Острые ощущения", "Трепет"]
        ),
        .init(
            word: "Wilt",
            transcription: "[wɪlt]",
            examples: [],
            translations: ["Слабеть"]
        ),
        .init(
            word: "Whirl",
            transcription: "[wɜːl]",
            examples: [],
            translations: ["Кружиться"]
        ),
        .init(
            word: "Alarm",
            transcription: "[əˈlɑːrm]",
            examples: [],
            translations: ["Тревога"]
        ),
        .init(
            word: "Rouse",
            transcription: "[raʊz]",
            examples: [],
            translations: ["Пробудить"]
        ),
        .init(
            word: "Wearisome",
            transcription: "[ˈwɪrisəm]",
            examples: [],
            translations: ["Утомительный"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
