//
//  Computers.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldComputers() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Ability",
            transcription: "",
            examples: [],
            translations: ["Способность", "Возможность"]
        ),
        .init(
            word: "Accurate",
            transcription: "",
            examples: [],
            translations: ["Точный"]
        ),
        .init(
            word: "To affect",
            transcription: "",
            examples: [],
            translations: ["Воздействовать"]
        ),
        .init(
            word: "Amount of data",
            transcription: "",
            examples: [],
            translations: ["Объем данных"]
        ),
        .init(
            word: "Approximately",
            transcription: "",
            examples: [],
            translations: ["Приблизительно"]
        ),
        .init(
            word: "To attain",
            transcription: "",
            examples: [],
            translations: ["Достигать"]
        ),
        .init(
            word: "Available",
            transcription: "",
            examples: [],
            translations: ["Доступный"]
        ),
        .init(
            word: "Broadband connection",
            transcription: "",
            examples: [],
            translations: ["Выделенное подключение"]
        ),
        .init(
            word: "To browse",
            transcription: "",
            examples: [],
            translations: ["Просматривать"]
        ),
        .init(
            word: "Browser",
            transcription: "",
            examples: [],
            translations: ["Браузер", "Окно просмотра"]
        ),
        .init(
            word: "To carry out",
            transcription: "",
            examples: [],
            translations: ["Выполнять"]
        ),
        .init(
            word: "Computer desk",
            transcription: "",
            examples: [],
            translations: ["Компьютерный стол"]
        ),
        .init(
            word: "Computer mouse",
            transcription: "",
            examples: [],
            translations: ["Компьютерная мышка"]
        ),
        .init(
            word: "Copier",
            transcription: "",
            examples: [],
            translations: ["Ксерокс", "Копир"]
        ),
        .init(
            word: "To count",
            transcription: "",
            examples: [],
            translations: ["Считать", "Сосчитать"]
        ),
        .init(
            word: "CPU",
            transcription: "",
            examples: [],
            translations: ["Центральный процессор"]
        ),
        .init(
            word: "To crack",
            transcription: "",
            examples: [],
            translations: ["Взломать"]
        ),
        .init(
            word: "Dangerous",
            transcription: "",
            examples: [],
            translations: ["Опасный"]
        ),
        .init(
            word: "Data",
            transcription: "",
            examples: [],
            translations: ["Данные", "Сведения"]
        ),
        .init(
            word: "Defense",
            transcription: "",
            examples: [],
            translations: ["Оборона", "Защита"]
        ),
        .init(
            word: "To deploy",
            transcription: "",
            examples: [],
            translations: ["Использовать", "Употреблять"]
        ),
        .init(
            word: "To design",
            transcription: "",
            examples: [],
            translations: ["Задумывать", "Придумывать", "Разрабатывать"]
        ),
        .init(
            word: "To determine",
            transcription: "",
            examples: [],
            translations: ["Определить"]
        ),
        .init(
            word: "Dial up",
            transcription: "",
            examples: [],
            translations: ["Доступ к сети через модемное подключение"]
        ),
        .init(
            word: "Digital",
            transcription: "",
            examples: [],
            translations: ["Цифровой"]
        ),
        .init(
            word: "Display",
            transcription: "",
            examples: [],
            translations: ["Дисплей"]
        ),
        .init(
            word: "To download",
            transcription: "",
            examples: [],
            translations: ["Загружать", "Скачать"]
        ),
        .init(
            word: "Display",
            transcription: "",
            examples: [],
            translations: ["Экран"]
        ),
        .init(
            word: "Sound card",
            transcription: "",
            examples: [],
            translations: ["Звуковая карта "]
        ),
        .init(
            word: "Case",
            transcription: "",
            examples: [],
            translations: ["Компьютерный корпус"]
        ),
        .init(
            word: "Computer mouse",
            transcription: "",
            examples: [],
            translations: ["Компьютерная мышь"]
        ),
        .init(
            word: "Mouse mat",
            transcription: "",
            examples: [],
            translations: ["Коврик для мыши"]
        ),
        .init(
            word: "Power indicator",
            transcription: "",
            examples: [],
            translations: ["Индикатор питания "]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .computers, typeTranslation: .enToRu)
    return bagOfGold
}
