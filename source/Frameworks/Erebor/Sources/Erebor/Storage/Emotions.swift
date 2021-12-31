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
            examples: [
                "She could have shouted aloud with joy",
                "Laughter is an instrument of human joy",
                "Her greatest joy lay in going to Jonesboro or Fayetteville with Will when he drove over on business"
            ],
            translations: ["Радость"]
        ),
        .init(
            word: "Delight",
            transcription: "",
            examples: [
                "\"It works!\" I cried in delight, and Mr Wells beamed up at me",
                "\"That is very kind of you,\" said Dorothea, looking up at Mr. Casaubon with delight",
                "Kate took a delight in the maneuvering and machinations of the game"
            ],
            translations: ["Восхищение", "Удовольствие"]
        ),
        .init(
            word: "Gaiety",
            transcription: "",
            examples: [
                "He felt young and free and filled with a hungry gaiety",
                "With the tide of hysterical gaiety and excitement flooding the city, they rushed into matrimony",
                "But the earnest attention in his eyes changed him, his mocking gaiety vanished"
            ],
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
            examples: [
                "Come on, where's your merriment?",
                "The old man roared with contemptuous merriment at Nately's look of embarrassed surprise",
                "I gazed at them for a long time, and went away only when I realized that they meant to keep up their merriment all night"
            ],
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
            examples: [
                "He gave her a tired laugh. \"Right you are. Then let's speak English just for fun\"",
                "What's the fun of being senior partner if you have to keep it a secret?",
                "They were four clean-cut kids who were having lots of fun, and they were driving Yossarian nuts"
            ],
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
            examples: [
                "Tony laughed. \"Certainly. It would be a pleasure\"",
                "With pleasure, Langdon thought, sliding the pistol under the seat",
                "Why did I flatter myself with being able to conquer it at my pleasure?"
            ],
            translations: ["Удовольствие"]
        ),
        .init(
            word: "Delectation",
            transcription: "",
            examples: [
                "The will is dominated by delectation",
                "Let's see what visual delights there are for our corneal delectation",
                "Wonders and astonishments for your delectation!"
            ],
            translations: ["Наслаждение", "Удовольствие"]
        ),
        .init(
            word: "Buzz",
            transcription: "[bʌz]",
            examples: [
                "A voder is a little box which can buzz and hiss and has controls to vary these elements to match those patterns",
                "I know that everything was turning round, and the words of the clergyman were just like the buzz of a bee in my ear",
                "\"This hive of industry,\" as the Director was fond of calling it, was in the full buzz of work "
            ],
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
            examples: [
                "The water's effervescent - the bubbles support you",
                "And I'm going to use Alka-Seltzer or any effervescent hangover cure pill will do",
                "Because even though I'm painfully shy and obsessed with death, I'm a really effervescent person"
            ],
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
            examples: [
                "To be able to enthuse for evil... to draw all the demons from the passers-by... and to chase them out into the world",
                "I'm not so enthused about people coming up and patting me on the back, saying, \"You're the best\"",
                "If you don't mind me saying, you don't seem particularly enthused"
            ],
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
            examples: [
                "His face was pale and there were beads of perspiration on his forehead. His eyes were curiously excited",
                "Rosamond enjoyed not only Lydgate's presence but its effect: she liked to excite jealousy",
                "In whom else couldst thou have excited such interest?"
            ],
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
            examples: [
                "Mr Bennet, you must exult like a sultan when you gaze upon your adorable ladies",
                "One character watches himself live, love and exult, before being betrayed, with the calm of someone shaving",
                "Inwardly she exulted. 'I think I will have a cup of tea now,' she said"
            ],
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
            examples: [
                "I thought of my fifty-guinea fee, of my wearisome journey, and of the unpleasant night which seemed to be before me",
                "Everything annoyed him that day--the parade was insufferably hot and wearisome",
                "It is not wearisome to you, I trust, Dorothea?"
            ],
            translations: ["Утомительный"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .emotions, typeTranslation: .enToRu)
    return bagOfGold
}
