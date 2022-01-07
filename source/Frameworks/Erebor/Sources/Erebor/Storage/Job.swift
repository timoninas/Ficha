//
//  Job.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldJob() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Case",
            transcription: "[keɪs]",
            examples: [],
            translations: ["Дело"]
        ),
        .init(
            word: "Company",
            transcription: "[ˈkʌmpəni]",
            examples: [],
            translations: ["Компания"]
        ),
        .init(
            word: "Work",
            transcription: "[wɜːk]",
            examples: [],
            translations: ["Работа"]
        ),
        .init(
            word: "Money",
            transcription: "[ˈmʌni]",
            examples: [],
            translations: ["Деньги"]
        ),
        .init(
            word: "Job",
            transcription: "[ʤɒb]",
            examples: [],
            translations: ["Работа"]
        ),
        .init(
            word: "Service",
            transcription: "[ˈsɜːvɪs]",
            examples: [
                "A service truck, Inspector",
                "- At least long enough for me to get it to the nearest service station",
                "She never could understand why I could not steal phone service as easily as we liberated power",
            ],
            translations: ["Услуга", "Обслуживание"]
        ),
        .init(
            word: "Office",
            transcription: "[ˈɒfɪs]",
            examples: [],
            translations: ["Офис"]
        ),
        .init(
            word: "Policy",
            transcription: "[ˈpɒlɪsi]",
            examples: [],
            translations: ["Политика"]
        ),
        .init(
            word: "Plan",
            transcription: "[plæn]",
            examples: [
                "The Delta Force's plan to stage an accident by arranging four dead bodies on the ice shelf was no longer a viable option",
                "We're all staying on your plan",
                "Who were they to interfere with God's master plan?"
            ],
            translations: ["План"]
        ),
        .init(
            word: "Control",
            transcription: "[kənˈtrəʊl]",
            examples: [],
            translations: ["Контроль"]
        ),
        .init(
            word: "Report",
            transcription: "[rɪˈpɔːt]",
            examples: [],
            translations: ["Отчет", "Доклад"]
        ),
        .init(
            word: "Site",
            transcription: "[saɪt]",
            examples: [],
            translations: ["Объект"]
        ),
        .init(
            word: "Performance",
            transcription: "[pəˈfɔːməns]",
            examples: [
                "I told him I thought it had been a very nicely managed and gentlemanly performance",
                "I'm saying their performance is identical",
                "And I prefer my boyfriend at peak performance"
            ],
            translations: ["Производительность"]
        ),
        .init(
            word: "Effort",
            transcription: "[ˈefət]",
            examples: [],
            translations: ["Усилие", "Труд"]
        ),
        .init(
            word: "Action",
            transcription: "[ækʃn]",
            examples: [],
            translations: ["Действие"]
        ),
        .init(
            word: "Activity",
            transcription: "[ækˈtɪvɪtɪ]",
            examples: [],
            translations: ["Деятельность"]
        ),
        .init(
            word: "Practice",
            transcription: "[ˈpræktɪs]",
            examples: [],
            translations: ["Практика"]
        ),
        .init(
            word: "Skill",
            transcription: "[skɪl]",
            examples: [],
            translations: ["Умение", "Навык"]
        ),
        .init(
            word: "Order",
            transcription: "[ˈɔːdə]",
            examples: [
                "BY ORDER OF THE MINISTRY OF MAGIC",
                "You don't have to use the Ionic order, use the Doric",
                "I believe I already gave you that order"
            ],
            translations: ["Порядок", "Приказ", "Заказ"]
        ),
        .init(
            word: "Meeting",
            transcription: "[ˈmiːtɪŋ]",
            examples: [
                "I imagine the press will be meeting you both at Southampton. Are you Miss Whitney's manager?",
                "That afternoon she canceled a board meeting and went home early",
                "This is a closed meeting"
            ],
            translations: ["Встреча"]
        ),
        .init(
            word: "Operation",
            transcription: "[ɒpəˈreɪʃn]",
            examples: [
                "The operation had taken nine hours",
                "We walked in on their operation",
                "I understood, but in its 200 years of operation, no one has successfully escaped from...",
            ],
            translations: ["Операция"]
        ),
        .init(
            word: "Interview",
            transcription: "[ˈɪntəvjuː]",
            examples: [
                "I got the interview!",
                "And you want to know whether I had a satisfactory interview with him!",
                "I've decided that I will help interview Geoff Hastings"
            ],
            translations: ["Интервью", "Собеседование"]
        ),
        .init(
            word: "Quality",
            transcription: "[ˈkwɒlɪtɪ]",
            examples: ["The food is of high (low) quality", "These wayside places have a reputation for low quality", "Like, they got a great quality of life, good restaurants"],
            translations: ["Качество"]
        ),
        .init(
            word: "Success",
            transcription: "[səkˈses]",
            examples: ["Success stories motivate people", "What a splendid notion! he said. Are you celebrating a success?", "I must match my mother's hard work, dedication, and success"],
            translations: ["Успех"]
        ),
        .init(
            word: "Task",
            transcription: " [tɑːsk]",
            examples: ["Here is your task for today", "Slowing Remy down had become Sophie's task", "I can work it out, it's like a task, I'm your apprentice, just watch me..."],
            translations: ["Задача"]
        ),
        .init(
            word: "Break",
            transcription: "[breɪk]",
            examples: ["Shall we take a break?",
                       "The important thing is to be careful not to break that spirit",
                       "Who knows when the hammer might slip and break a nose?"],
            translations: ["Перерыв"]
        ),
        .init(
            word: "Mission",
            transcription: "[mɪʃn]",
            examples: ["His mission is top secret and extremely dangerous", "The Delta team jokingly referred to that mission as \"insertion behind enemy lines\""],
            translations: ["Миссия"]
        ),
        .init(
            word: "Labor",
            transcription: "",
            examples: [
                "manual labor",
                "The company used child labor"
            ],
            translations: ["Труд"]
        ),
        .init(
            word: "Weekend",
            transcription: "[ˈwiːkˈɛnd]",
            examples: [
                "You'd still be covering the weekend arts bulletin if I hadn't given you your break",
                "To everyone’s delight except Harry’s, there was to be another Hogsmeade trip on the very last weekend of the term",
                "How dare the servants take the weekend off, Tracy thought indignantly. They should all be discharged"
            ],
            translations: ["Уикэнд", "Выходные"]
        ),
        .init(
            word: "Attempt",
            transcription: "[əˈtɛmpt]",
            examples: [
                "He wondered if her current slumber was just a deception, a pathetic attempt to avoid further service to him",
                "Can't you just be a normal boyfriend and support me as I attempt to have a normal college experience?",
                "\"If it was an attempt at free publicity - well, what atrocious taste!\""
            ],
            translations: ["Попытка"]
        ),
        .init(
            word: "Day off",
            transcription: "[deɪ ɒf]",
            examples: [
                "- where he just... when he was taking the day off?",
                "half day off",
                "As a matter of fact, I thought I was entitled to a day off after the good news!"
            ],
            translations: ["Выходной день"]
        ),
        .init(
            word: "Lack (of something)",
            transcription: "[læk]",
            examples: [
                "Most unsettling, however, was the apparent lack of a floor",
                "Again, they would swim upward, this time reaching the surface inside the habisphere, where they would eventually die for lack of saltwater",
                "This was the one area where Faraday's childhood poverty and lack of formal education actually held him back"
            ],
            translations: ["Нехватка"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .job, typeTranslation: .enToRu)
    return bagOfGold
}
