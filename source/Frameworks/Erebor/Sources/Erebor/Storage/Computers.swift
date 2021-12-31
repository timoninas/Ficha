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
            transcription: "[ˈkɒpɪə]",
            examples: [
                "I was planning on stealing the copier",
                "You know the old copier in my office?",
                "You got a copier, right?"
            ],
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
            transcription: "[()siː()piːˈjuː]",
            examples: [
                "The CPU seems to be handling the high poly count",
                "The CPU from the first Terminator",
                "CPU - revolvetra.com"
            ],
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
            transcription: "[ˈdeɪnʤərəs]",
            examples: [
                "He's a dangerous man, and he's breaking the law",
                "I had proposed to Amelia that we stow away on one of their deadly projectiles, but this was a dangerous idea",
                "There is nothing worse, in Texas, than Comanches on the war trail-nothing half so dangerous"
            ],
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
            transcription: "[dɪˈfens]",
            examples: [
                "All the Defense leaders will be here-- at least two dozen high-value targets",
                "He couldn't tell me anything useful about the town's defenses",
                "But the order was issued by someone who penetrated our defense communications network"
            ],
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
            transcription: "[dɪˈtɜːmɪn]",
            examples: [
                "The purpose, the site, the material determine the shape",
                "The color of a diamond helps determine its value",
                "Graeber sniffed; he could not determine where it came from"
            ],
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
            transcription: "[ˈdɪʤɪtl]",
            examples: [
                "He even refused to connect to the Internet for fear of hackers infiltrating his sacred digital vault",
                "The Goya's SHINCOM 2100 digital communications system was a platform with which Rachel was familiar enough",
                "It's like a digital Black hole"
            ],
            translations: ["Цифровой"]
        ),
        .init(
            word: "To download",
            transcription: "[ˈdaʊnləʊd]",
            examples: [
                "We'd have to download the entire cloud",
                "Download shared files",
                "Yeah, and she slipped you an emo download, dude"
            ],
            translations: ["Загружать", "Скачать"]
        ),
        .init(
            word: "Display",
            transcription: "[dɪsˈpleɪ]",
            examples: [
                "And what is this display now, as amusing as you are?",
                "Soon the entire display was filled with a high view of land, but we were at such an altitude that it was almost impossible to see details",
                "They sat, not touching her, bewildered by her display"
            ],
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
            examples: [
                "You mean cases like the Bravo case, Adelaide Bartlett and all the rest of them?",
                "The object was to give the opponent a chance to choose the lesser of two evils-in this case, the truth",
                "Except in the one grand case of Captain Lennox's offer, everything went on with the regularity of clockwork"
            ],
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
            examples: [
                "What happens if the power blinks out while we're in transit?",
                "I will prove my power",
                "And I will do everything in my power to find her"
            ],
            translations: ["Индикатор питания "]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .computers, typeTranslation: .enToRu)
    return bagOfGold
}
