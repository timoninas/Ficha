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
        .init(
            word: "Dishwasher",
            transcription: " [ˈdɪʃwɒʃə]",
            examples: [
                "While you're bothering the world's most famous scientist, be sure to show him how funny he looks getting stuck under our dishwasher",
                "And when you load the dishwasher, you can't put a big, flat bowl on the bottom",
                "The poisoning was from iodine, not arsenic, as the dishwasher had mistakenly jibed"
            ],
            translations: ["Посудомоечная машина"]
        ),
        .init(
            word: "Washing machine",
            transcription: "[ˈwɒʃɪŋ məˈʃiːn]",
            examples: [
                "The ocean thundered in around her, swirling up under her back, lifting her now off the chair, tossing her upside down like a sock in a washing machine",
                "David wants to know how to use the washing machine",
                "- Your washing machine broken?"
            ],
            translations: ["Стиральная машина", "Моечная машина"]
        ),
        .init(
            word: "Clothes dryer",
            transcription: " [kləʊðz]",
            examples: [
                "Well, you put the wet clothes in the dryer, you close the door and you wait",
                "I'VE GOT TO PUT THE CLOTHES IN THE DRYER",
                "Samatha, put the clothes in the dryer and buryJelly"
            ],
            translations: ["Сушилка для одежды"]
        ),
        .init(
            word: "Bin",
            transcription: " [bɪn]",
            examples: [
                "He has a priceless bin of port in some artful cellar under the Fields, which is one of his many secrets",
                "Does he still believe he has enough in the money bin to buy back his life?",
                "Discretely, I squirted the difference into a bin",
            ],
            translations: ["Мусорная корзина"]
        ),
        .init(
            word: "Wardrobe",
            transcription: "",
            examples: [
                "Mrs Leidner had only had a very simple wardrobe with her and it was soon sorted and packed up into a couple of suitcases",
                "By the same brilliant reasoning, every man's body is to be found in the neighbourhood of his wardrobe",
                "Now, to pass to another subject, had your mistress a dark green dress in her wardrobe?"
            ],
            translations: ["Шкаф для одежды", "Платяной шкаф"]
        ),
        .init(
            word: "To iron",
            transcription: "[tu ˈaɪən]",
            examples: [
                "Now, if you would all please excuse me... my mommy has to iron my corduroys",
                "I'm going to be carrying some scrap iron in this truck, Jeff explained",
                "A big rusty iron ball at the end of a chain"
            ],
            translations: ["Гладить"]
        ),
        .init(
            word: "To press",
            transcription: "[tə pres]",
            examples: [
                "The tumor's starting to press against your esophagus",
                "I need you to press this as hard as you can",
                "He trained them to press levers"
            ],
            translations: ["Погладить"]
        ),
        .init(
            word: "Living",
            transcription: "[ˈlɪvɪŋ]",
            examples: [
                "Then his father had carefully placed the rose on a high dusty shelf in the darkest corner of the living room",
                "I mean, a string quartet in my living room - who does that?",
                "I can't live in a room with landscapes, said Ostap",
            ],
            translations: ["Гостиная"]
        ),
        .init(
            word: "Sitting room",
            transcription: "[ˈsɪtɪŋ ruːm]",
            examples: [
                "He glanced at Atticus, then at the jury, then at Mr. Underwood sitting across the room",
                "Only it's dull enough to sit in a room where everything speaks to you of a dead friend",
                "I entered the sitting room and turned on the light. I put my vest on"
            ],
            translations: ["Гостиная"]
        ),
        .init(
            word: "Lounge",
            transcription: "[laʊndʒ]",
            examples: [
                "IX Miss Sainsbury Seale was in the dimly lit lounge of the Glengowrie Court Hotel, having tea",
                "And I have no intention of winding up back here, in the losers' lounge",
                "The manager said Belser picked up a shift at the Vonner street lounge"
            ],
            translations: ["Гостиная", "Гостиная комната"]
        ),
        .init(
            word: "Dirty",
            transcription: "[ˈdɜːti]",
            examples: [
                "On the chimney-piece, scattered over with paints and brushes, were a cup, a dirty plate, and a tea-pot",
                "Indeed Mr. Moss's house, though somewhat dirty, was splendid throughout",
                "From sleeping in his clothes he felt sticky and dirty"
            ],
            translations: ["Грязный", "Пакостный"]
        ),
        .init(
            word: "Filthy",
            transcription: "[ˈfɪlθi]",
            examples: [
                "Then at last my knife-arm came free, and I slashed wildly at any part of the filthy body that presented itself",
                "Some filthy swine in town had told them about him, because they came straight here and asked for him",
                "Gold, silver, round their necks, round their wrists, in their filthy mouths!"
            ],
            translations: ["Грязный", "Мерзкий"]
        ),
        .init(
            word: "Mud",
            transcription: "[mʌd]",
            examples: [
                "I had half a mind to spend it by my study fire, instead of wading through heath and mud to Wuthering Heights",
                "It doesn't do for Scarlett to stay away too long from the patch of red mud she loves",
                "As the mud turns into rock, the bugs get fossilized in stone"
            ],
            translations: ["Грязь", "Слякоть"]
        ),
        .init(
            word: "Dirt",
            transcription: "[dɜːt] ",
            examples: [
                "Standing around jabbering ain't gonna get the dirt out of that ground",
                "From the dirt, these picture have been here a long time",
                "If you're interested, I have dirt on bree"
            ],
            translations: ["Грязь", "Нечистоты"]
        ),
        .init(
            word: "Door",
            transcription: "[dɔː]",
            examples: [
                "Together we shifted the folding screen to one side, then I turned the handle of the door",
                "The door was closed, but through the window she could see a man sitting at a computer",
                "The door to boundless opportunities is now open for you, Shura"
            ],
            translations: ["Дверь", "Вход"]
        ),
        .init(
            word: "House",
            transcription: "[ˈhaʊs]",
            examples: [
                "Filled with anticipation, they bought a small house near Pasadena, where Celia got a job as a science teacher",
                "I can't sit here forever, she told herself. Why don't I just go take a look at the house? A quick look",
                "The house was so small, the furnishings so very simple"
            ],
            translations: ["Дом", "Здание", "Жилье"]
        ),
        .init(
            word: "At home",
            transcription: "[ət həʊm]",
            examples: [
                "Here's something I want everyone to watch at home tonight",
                "I taught a \"Massage Yourself at Home\" workshop",
                "I mean, they want to see you at home"
            ],
            translations: ["Дома", "На родине"]
        ),
        .init(
            word: "Oven",
            transcription: "[ˈʌvn̩]",
            examples: [
                "My little girl was singing a song about a pie that would rather burn in the oven than land in the stomach of a fat nobleman",
                "Or a cider mill in the grinding, or bread fresh from the oven?",
                "Keith was basting a roast in the oven"
            ],
            translations: ["Духовка", "Термостат"]
        ),
        .init(
            word: "Shower",
            transcription: "[ˈʃaʊə]",
            examples: [
                "There was a shower right between every two rooms in our wing, and about eighty-five times a day old Ackley barged in on me",
                "The city dissolved in a shower of ancient glass and splintered quartz",
                "Well, some of it... the shower, kitchen counter, mudroom"
            ],
            translations: ["Душ", "Ливень"]
        ),
        .init(
            word: "Fence",
            transcription: "[fens]",
            examples: [
                "No one seemed to want to. Harry, Ron, and Hermione, however, approached the fence cautiously",
                "All its garbage just blows off, gets caught in the snow fence by the side of the road",
                "They tore down Mr. Fenchel's white picket fence and burned the front out of his house"
            ],
            translations: ["Забор", "Ограда"]
        ),
        .init(
            word: "To close",
            transcription: "[tə kləʊz]",
            examples: [
                "I strain so hard my eyes ache and I have to close them, and when I open them again the colonel is gone",
                "I'll have to close you up till you do,' says the constable",
                "Then came more cavalry to close the column"
            ],
            translations: ["Задёрнуть занавески", "Закрыть"]
        ),
        .init(
            word: "Draw the curtains",
            transcription: "[drɔː ðə ˈkɜːtn̩z]",
            examples: [
                "If I were to draw the curtains, and look out of that window, I should feel the acutest pain all over my face",
                "Let me draw the curtains, and light the candles, and make things more comfortable about you",
                "Do you want me to draw the curtains?"
            ],
            translations: ["Задёрнуть занавески"]
        ),
        .init(
            word: "To close",
            transcription: "[tə kləʊz]",
            examples: [
                "I strain so hard my eyes ache and I have to close them, and when I open them again the colonel is gone",
                "I'll have to close you up till you do,' says the constable",
                "They're going to close the bridges"
            ],
            translations: ["Закрывать"]
        ),
        .init(
            word: "To shut",
            transcription: "[tə ʃʌt]",
            examples: [
                "They control you on paper, and unless you want to shut down for the next 90 days, this is what you have to do",
                "So from now on you'll all have to shut your eyes or look in the other direction when she comes in that way",
                "As it is, all I can say is for you to shut your God-damn mouth"
            ],
            translations: ["Закрыть", "Захлопнуть"]
        ),
        .init(
            word: "Lock",
            transcription: "[lɒk]",
            examples: [
                "Tracy put the key in the lock, and the door swung open. She waited a full minute before she stepped inside",
                "In my opinion as best computerman in Luna, Mike could not remove this lock once it was set up",
                "It has a shed with bars and an iron door and a lock"
            ],
            translations: ["Замок", "Блокировка"]
        ),
        .init(
            word: "Homeland",
            transcription: "[ˈhəʊmlənd]",
            examples: [
                "If you had mentioned 'patriotism' to a Loonie, he would have stared--or thought you were talking about his homeland",
                "These people were wrenched from their homeland and disappeared into the cold seas of the Atlantic, forgotten until today",
                "Homeland has been informed that they are officially domestic terrorists"
            ],
            translations: ["Родина", "Отечество", "Отчизна"]
        ),
        .init(
            word: "Tenement",
            transcription: "[ˈtenəmənt]",
            examples: [
                "And almost at the same moment that the door closed behind him, there was an explosion in an old tenement on the other side of the city",
                "I subsequently left the domain and moved here to Edo, where I found shelter in a back-alley tenement",
                "I wrote it one night when I was sixteen and stood on the roof of a tenement"
            ],
            translations: ["Многоквартирный дом", "Жилой дом", "Обитель"]
        ),
        .init(
            word: "Barracks",
            transcription: "[ˈbærəks]",
            examples: [
                "'Cleaned out!' the man who had called Graeber a barracks crapper said in despair",
                "Exactly four urinals in the staff building, two company latrines in barrack V, and... one floor in the officer's casino",
                "They live in a great barrack of a house way down in the country, miles from anywhere"
            ],
            translations: ["Казарменный", "Барак", "Казарма"]
        ),
        .init(
            word: "Shanty",
            transcription: "",
            examples: [
                "He had been born in a wattle-and-daub shanty exactly on the Tropic of Capricorn, outside the town of Longreach in Western Queensland",
                "Every time I thought of you out in that shanty, I got the creeps",
                "The old mud shanty was bursting with it"
            ],
            translations: ["Лачуга", "Хибарка", "Хижина"]
        ),
        .init(
            word: "Hermitage",
            transcription: "[ˈhɜːmɪtɪʤ]",
            examples: [
                "Prajapati daksha and sage bhrigu are welcome to this poor sage's hermitage",
                "So remember then; The Hermitage, Horizon",
                "TO THE HERMITAGE, by Malcolm Bradbury"
            ],
            translations: ["Эрмитаж", "Скит", "Хижина отшельника"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .home, typeTranslation: .enToRu)
    return bagOfGold
}
