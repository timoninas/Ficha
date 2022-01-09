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
            examples: [
                "I have an apartment here in D.C. Private. Comfortable",
                "Louise had estates in Long Island and the Bahamas, a villa in Sardinia, and a large apartment on Avenue Foch in Paris",
                "The Sisters entered the apartment shyly, almost on tiptoe"
            ],
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
            examples: [
                "It was a broad square slab that hung off the glacier like a colossal balcony, surrounded on three sides by precipices to the ocean",
                "She was holding her hands on the rail of the balcony and shaking back and forth",
                "Nearby, a set of double doors stood open, beyond them a balcony"
            ],
            translations: ["Балкон"]
        ),
        .init(
            word: "Barn",
            transcription: "[bɑːn]",
            examples: [
                "It would make him long to weep, but he never wept anymore; not since that night in the barn after the police had brought him home",
                "A year ago you set me up to be killed. At the barn",
                "He put on his shirt and left the barn",
                
            ],
            translations: ["Сарай", "Фмбар"]
        ),
        .init(
            word: "Basement",
            transcription: "[ˈbeɪsmənt]",
            examples: [
                "The air inside was bitter, like a basement in winter",
                "They caught me making out with a girl in the basement and all hell broke loose",
                "Next morning they rang through from the basement to say that Mr Fennell was on the telephone"
            ],
            translations: ["Подвал", "Цокольный этаж", "Фундамент"]
        ),
        .init(
            word: "Bath",
            transcription: "[bɑːθ]",
            examples: [
                "He got up and went to his bath and I began putting things methodically in my suitcase",
                "But if you're going to turn this into a blood bath, you can forget about me",
                "The toilet flushed, the bath had fresh water; more modern amenities than either Drogheda or Himmelhoch, Meggie thought in amusement"
            ],
            translations: ["Ванна", "Баня", "Купание"]
        ),
        .init(
            word: "Bathroom",
            transcription: "[ˈbɑːθruːm]",
            examples: [
                "\"We had an individual kitchen and bathroom at Cinna,\" said Dors with an air of resignation",
                "I'll step into the bathroom and put this thing on",
                "He headed for the bathroom"
            ],
            translations: ["Ванная комната", "Туалет"]
        ),
        .init(
            word: "Bed",
            transcription: "[bed]",
            examples: [
                "My bed was hot, I noticed",
                "A bishop from Palermo appeared at my hospital bed and took me in",
                "A clock glowed 10:14 p.m. The bed was not her own"
            ],
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
            examples: [
                "'I'll fight you all!' Dobbs screamed back at them, and stood up on a rickety wooden chair, waving the gun wildly",
                "Feeling slightly unreal, I led him to the chair farthest from Atticus and Mr. Tate",
                "Oh, you know, chairing the hospital gala, voter-registration drive, the usual 100 Miles an hour"
            ],
            translations: ["Стул", "Кресло", "Кафедра"]
        ),
        .init(
            word: "Chimney",
            transcription: "[ˈtʃɪmnɪ]",
            examples: [
                "He added the proper chemicals and carried the tray to a small chimney behind him",
                "I could just see the stone chimney of the cottage through a gap in the dark trees",
                "The place might have been deserted, save for the smoke he saw rising from the kitchen chimney"
            ],
            translations: ["Дымоход", "Камин"]
        ),
        .init(
            word: "Cottage",
            transcription: "[kaʊtʃ]",
            examples: [
                "They all lived in a charming cottage, and there were lovely grounds around the prison farm",
                "They stood in silence while he ran into the cottage; returning in a moment with a crumpled scrap of paper",
                "Tracy looked around. It was a fairly large cottage, neat and attractively furnished"
            ],
            translations: ["Диван", "Кушетка"]
        ),
        .init(
            word: "Cup",
            transcription: "[kʌp]",
            examples: [
                "Alice Jardine was having a cup of tea when Jamie walked into the kitchen",
                "Half an hour. later, Mr. Aaa, seated in his library sipping a bit of electric fire from a metal cup, heard the voices outside in the stone causeway",
                "A single drop in a cup of wine suffices to soothe ragged nerves"
            ],
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
        .init(
            word: "Fridge",
            transcription: "[frɪʤ]",
            examples: [
                "Our new fridge?",
                "Fridge full of ketchup?",
                "I returned my yogurt fridge"
            ],
            translations: ["Холодильник"]
        ),
        .init(
            word: "Freezer",
            transcription: "[ˈfriːzə]",
            examples: [
                "The rock could have been blasted by a slush-hydrogen engine and then rapidly cooled in a cryogenic freezer",
                "There's no knowing what kind of evil might be lurking in the freezer chests...",
                "- Then stay out of my freezer"
            ],
            translations: ["Морозильная камера"]
        ),
        .init(
            word: "Cooker",
            transcription: "[ˈkʊkə]",
            examples: [
                "Whoever it was could have gone on to the Lamberts' boat, loosened the gas tube to the cooker",
                "I've thrown the cooker away. Cos that's what they've done",
                "I even ordered the pressure cooker from Turkmenistan"
            ],
            translations: ["Плита", "Печь"]
        ),
        .init(
            word: "Oven",
            transcription: "[ʌvn]",
            examples: [
                "The rocket lay on the launching field, blowing out pink clouds of fire and oven heat",
                "Or a cider mill in the grinding, or bread fresh from the oven?",
                "My little girl was singing a song about a pie that would rather burn in the oven than land in the stomach of a fat nobleman"
            ],
            translations: ["Духовка", "Духовой шкаф"]
        ),
        .init(
            word: "Hob",
            transcription: "[hɒb]",
            examples: [
                "The hob is from the '30s",
                "I burnt my fingers on the hob this morning",
                "We catch 'em in a crossfire and send 'em down to see Old Hob"
            ],
            translations: ["Поверхность в печи или камине для разогревания или выпечки"]
        ),
        .init(
            word: "Sink",
            transcription: "[sɪŋk]",
            examples: [
                "Climbing back down Gabrielle picked up the cuff links and put them back on the sink",
                "Oh, just some baby formula being stored under a sink with a dripping faucet",
                "The potatoes is all ready peeled, dear, you'll find them by the sink"
            ],
            translations: ["Раковина"]
        ),
        .init(
            word: "Work surface",
            transcription: "[wɜːk ˈsɜːfɪs]",
            examples: [
                "They used them as thresholds, work surfaces, flagstones",
                "Uh, Mr. Palmer, let's get our corporal to a more suitable work surface",
                "She's sitting on your work surface"
            ],
            translations: ["Рабочая поверхность", "Столешница"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .home, typeTranslation: .enToRu)
    return bagOfGold
}
