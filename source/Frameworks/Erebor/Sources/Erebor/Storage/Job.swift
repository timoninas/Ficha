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
            examples: [],
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
            word: "site",
            transcription: "[saɪt]",
            examples: [],
            translations: ["объект"]
        ),
        .init(
            word: "performance",
            transcription: "[pəˈfɔːməns]",
            examples: [],
            translations: ["производительность"]
        ),
        .init(
            word: "effort",
            transcription: "[ˈefət]",
            examples: [],
            translations: ["усилие", "труд"]
        ),
        .init(
            word: "action",
            transcription: "[ækʃn]",
            examples: [],
            translations: ["действие"]
        ),
        .init(
            word: "activity",
            transcription: "[ækˈtɪvɪtɪ]",
            examples: [],
            translations: ["деятельность"]
        ),
        .init(
            word: "practice",
            transcription: "[ˈpræktɪs]",
            examples: [],
            translations: ["практика"]
        ),
        .init(
            word: "skill",
            transcription: "[skɪl]",
            examples: [],
            translations: ["умение", "навык"]
        ),
        .init(
            word: "order",
            transcription: "[ˈɔːdə]",
            examples: [],
            translations: ["порядок", "приказ", "заказ"]
        ),
        .init(
            word: "meeting",
            transcription: "[ˈmiːtɪŋ]",
            examples: [],
            translations: ["встреча"]
        ),
        .init(
            word: "operation",
            transcription: "[ɒpəˈreɪʃn]",
            examples: [
            "The operation had taken nine hours",
            "We walked in on their operation",
            "I understood, but in its 200 years of operation, no one has successfully escaped from...",
            ],
            translations: ["операция"]
        ),
        .init(
            word: "interview",
            transcription: "[ˈɪntəvjuː]",
            examples: [
            "I got the interview!",
            "And you want to know whether I had a satisfactory interview with him!",
            "I've decided that I will help interview Geoff Hastings"
            ],
            translations: ["интервью", "собеседование"]
        ),
        .init(
            word: "quality",
            transcription: "[ˈkwɒlɪtɪ]",
            examples: ["The food is of high (low) quality", "These wayside places have a reputation for low quality", "Like, they got a great quality of life, good restaurants"],
            translations: ["качество"]
        ),
        .init(
            word: "success",
            transcription: "[səkˈses]",
            examples: ["Success stories motivate people", "What a splendid notion! he said. Are you celebrating a success?", "I must match my mother's hard work, dedication, and success"],
            translations: ["успех"]
        ),
        .init(
            word: "task",
            transcription: " [tɑːsk]",
            examples: ["Here is your task for today", "Slowing Remy down had become Sophie's task", "I can work it out, it's like a task, I'm your apprentice, just watch me..."],
            translations: ["задача"]
        ),
        .init(
            word: "break",
            transcription: "[breɪk]",
            examples: ["Shall we take a break?",
                      "The important thing is to be careful not to break that spirit",
                       "Who knows when the hammer might slip and break a nose?"],
            translations: ["перерыв"]
        ),
        .init(
            word: "mission",
            transcription: "[mɪʃn]",
            examples: ["His mission is top secret and extremely dangerous", "The Delta team jokingly referred to that mission as \"insertion behind enemy lines\""],
            translations: ["миссия"]
        ),
        .init(
            word: "labor",
            transcription: "",
            examples: ["manual labor", "The company used child labor"],
            translations: ["труд"]
        ),
        .init(
            word: "weekend",
            transcription: "[ˈwiːkˈɛnd]",
            examples: [],
            translations: ["уикэнд", "выходные"]
        ),
        .init(
            word: "attempt",
            transcription: "[əˈtɛmpt]",
            examples: [],
            translations: ["попытка"]
        ),
        .init(
            word: "day off",
            transcription: "[deɪ ɒf]",
            examples: [],
            translations: ["выходной день"]
        ),
        .init(
            word: "lack (of something)",
            transcription: "[læk]",
            examples: [],
            translations: ["нехватка"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .job, typeTranslation: .enToRu)
    return bagOfGold
}
