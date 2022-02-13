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
            examples: [
                "Putting the bread and butter on a log between them, he sank his white teeth into the meat with evident enjoyment",
                "Not only would she not touch it herself, but she resisted its enjoyment by anyone else",
                "With her, actual enjoyment is not necessary to my happiness"
            ],
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
            examples: [
                "Marks from the front side flush with the muzzle",
                "\"I noticed she had a kind of bright flush,\" Ethel repeated",
                "At supper Faye's face was flushed"
            ],
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
            examples: [
                "There was something about her use of the plural that sent a pleasurable, though not entirely guiltless, thrill through me",
                "Arriving now at the doorway of the Communications Office, Tench felt alive with the thrill of the fight",
                "Thrill of the kill"
            ],
            translations: ["Острые ощущения", "Трепет"]
        ),
        .init(
            word: "Wilt",
            transcription: "[wɪlt]",
            examples: [
                "And some people respond to... that pressure and some people simply",
                "Some girls blossom only at night and wilt in the daylight",
                "Braddock looks like he's finally starting to wilt"
            ],
            translations: ["Слабеть"]
        ),
        .init(
            word: "Whirl",
            transcription: "[wɜːl]",
            examples: [
                "During all this whirl of disaster he had never once lost his head or his courage",
                "He was sucked under in the whirl by Nick's right leg and came to the surface a little way down stream",
                "A sorrowful sight I saw: dark night coming down prematurely, and sky and hills mingled in one bitter whirl of wind and suffocating snow"
            ],
            translations: ["Кружиться"]
        ),
        .init(
            word: "Alarm",
            transcription: "[əˈlɑːrm]",
            examples: [
                "You're gonna trigger the alarm",
                "The howling of the preliminary alarm grew louder",
                "And you aim these at an alarm circuit and the point where the beams cross..."
            ],
            translations: ["Тревога"]
        ),
        .init(
            word: "Rouse",
            transcription: "[raʊz]",
            examples: [
                "Noise does not rouse a drunken man; silence awakens him",
                "It, it seems he's... refused to rouse, sir",
                "Must I close this?' I asked, in order to rouse him; for he would not stir"
            ],
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
        .init(
            word: "Hot-blooded",
            transcription: "[ˌhɑːt ˈblʌdɪd]",
            examples: [
                "Then Jack found the throat and the hot blood spouted over his hands",
                "Hot blood pumping down my throat",
                "I can't, because I have hot blood"
            ],
            translations: ["Вспыльчивый"]
        ),
        .init(
            word: "Hyped up",
            transcription: "[ˌhaɪpt ˈʌp]",
            examples: [],
            translations: ["Расшевеленный", "Возбужденный"]
        ),
        .init(
            word: "Illuminate",
            transcription: "[ɪˈluːmɪneɪt]",
            examples: [
                "No, but put a sky-light on top of his head to illuminate inwards",
                "Sir, the seat belt sign is still illuminated",
                "God has started to illuminate you, but let His grace be complete"
            ],
            translations: ["Освещать"]
        ),
        .init(
            word: "Illumine",
            transcription: "[ɪˈluːmɪn]",
            examples: [
                "She opened her mouth wide and placed the light so that it would illumine her larynx",
                "I'm going to light it... and illumine us",
                "The scorching rays of the sun illumined the blossoming meadows and environs ..."
            ],
            translations: ["Освещать"]
        ),
        .init(
            word: "Inflamed",
            transcription: "[ɪnˈfleɪmd]",
            examples: [
                "A policy no doubt intended to inflame a jury",
                "This inflamed her impatient friend still more",
                "We should be easing tensions, not inflaming them"
            ],
            translations: ["Вспыхнувший", "Очень злой", "Взволнованный"]
        ),
        .init(
            word: "Intoxicated",
            transcription: "[ɪnˈtɑːksɪkeɪtɪd]",
            examples: [
                "I feel like Robert's intoxicated you to the point where you can't see straight",
                "Intoxicated, he was behaving as though, at the very least, he were a visiting World Controller",
                "Zoe was intoxicated with wine and dance"
            ],
            translations: ["Опьяненный"]
        ),
        .init(
            word: "Intoxicating",
            transcription: "[ɪnˈtɑːksɪkeɪtɪŋ]",
            examples: [
                "Yes, yes, the quality, the texture, the intoxicating aroma",
                "And some of the soldiers who were intoxicated at the time of the battle did better, they recovered better",
                "I feel like Robert's intoxicated you to the point where you can't see straight"
            ],
            translations: ["Опьяняющий"]
        ),
        .init(
            word: "Manic",
            transcription: "[ˈmænɪk]",
            examples: [
                "Lecturing me on manic depression",
                "Maybe it has something to do with you validating Darby's delusions, which then triggered her manic episode",
                "- They will be, if we successfully marry your manic energy to my brilliant plan!"
            ],
            translations: ["Маниакальный"]
        ),
        .init(
            word: "Nail-biting",
            transcription: "[ˈneɪl baɪtɪŋ]",
            examples: [
                "- Is there a cure for nail biting?",
                "Not a fan of nail biting",
                "His nails were bitten to the quick, for while some trembling boy was construing he would sit at his desk"
            ],
            translations: ["Грызущий ногти", "Испытывающий беспокойство", "Напряжение"]
        ),
        .init(
            word: "Overexcited",
            transcription: "[ˌəʊvərɪkˈsaɪtɪd]",
            examples: [
                "Hard to coerce a man who faints if he gets overexcited",
                "I got overexcited, I must have let it slip",
                "You were jumping up and down, running around and getting completely overexcited"
            ],
            translations: ["Перевозбужденный"]
        ),
        .init(
            word: "Angry",
            transcription: "[ˈæŋgrɪ]",
            examples: [
                "Now they could hear angry voices, growing louder and louder. Madam Pomfrey was staring at the door",
                "His face was streaked with angry tears as we made our way through the cheerful crowd",
                "He was confused and blinded by the rush of it and the beat of angry wings"
            ],
            translations: ["Злой", "Гневный"]
        ),
        .init(
            word: "Anger",
            transcription: "[ˈæŋgə]",
            examples: [
                "She stood there, watching his curiosity get the better of his anger",
                "Rachel's surprise gave way immediately to anger",
                "Abra's face reddened with anger"
            ],
            translations: ["Злость", "Гнев", "Ярость"]
        ),
        .init(
            word: "Annoyed",
            transcription: "[əˈnɔɪd]",
            examples: [
                "She did not get up and leave the room, as she had done in former days, when his abruptness or his temper had annoyed her",
                "The only thing that could annoy Jack more now is if he opens that can and it's all left-handed peaches",
                "How on earth will you ever annoy me?",
            ],
            translations: ["Раздраженный", "Недовольный"]
        ),
        .init(
            word: "Bored",
            transcription: "[bɔːd]",
            examples: [
                "They followed that about a hundred yards and then bored through eight feet of soil to get to the bank's foundation",
                "Bore a small hole in his skull to help relieve the pressure",
                "Her eyes still bored into me as they had done at tea"
            ],
            translations: ["Скучающий"]
        ),
        .init(
            word: "Boring",
            transcription: "[ˈbɔːrɪŋ]",
            examples: [
                "Sarah was the doctor, then there was the one with the spots, then the one with the nose and then, who was after the boring teacher?",
                "Tony loathed parties. He hated the endless, boring conversations, the boastful men and the predatory women",
                "All the things Father wanted me to do and be were such boring things"
            ],
            translations: ["Скучный", "Унылый"]
        ),
        .init(
            word: "Calm",
            transcription: "[kɑːm]",
            examples: [
                "Even in the pounding wind, the night felt suddenly calm... as if a storm had let up unexpectedly",
                "It was still surrounded by pylons, and the surface of the water appeared calm",
                "When the calm, aloof eyes looked into hers, she realized who he was"
            ],
            translations: ["Спокойный"]
        ),
        .init(
            word: "Careful",
            transcription: "[ˈkeəf(ə)l",
            examples: [
                "'So much the better, but you must be very careful and look after yourself, Comrade Rusanov,' Dontsova warned him",
                "And she was careful those first years; there was never a murmur about her, never a whisper",
                "There was a balanced, careful, wise creature who smiled shyly but very firmly at him",
            ],
            translations: ["Заботливый"]
        ),
        .init(
            word: "Care",
            transcription: "[keə]",
            examples: [
                "I'll make arrangements to get him into a private sanitarium where he can get the proper care",
                "With ludicrous care he embraced the rock, pressing himself to it above the sucking sea",
                "Debbie can't take care of a special needs kid on top of day care"
            ],
            translations: ["Забота", "Уход", "Присмотр"]
        ),
        .init(
            word: "Confused",
            transcription: "[kənˈfjuːzd]",
            examples: [
                "For several months during his childhood there had been confused street fighting in London itself, some of which he remembered vividly",
                "I had a confused dream, one of those that you forget on the spot when you wake up",
                "She was angry, with the complicated and confused anger that made her inert"
            ],
            translations: ["Недоумевающий", "Озадаченный"]
        ),
        .init(
            word: "Confident",
            transcription: "[ˈkɒnfɪdənt]",
            examples: [
                "I'm gonna kill the audition with my confident stillness and empathy, both, and you... you just got the perfect ring",
                "With the confident tone of a man of enormous influence, the Teacher explained what was to be done",
                "You're very confident and very insistent"
            ],
            translations: ["Уверенный", "Самонадеянный"]
        ),
        .init(
            word: "Dangerous",
            transcription: "[ˈdeɪnʤərəs]",
            examples: [
                "It was hard on the girl, terribly hard; perhaps this journey, dangerous though it might be, would not be altogether a bad thing for her",
                "I had proposed to Amelia that we stow away on one of their deadly projectiles, but this was a dangerous idea",
                "Tibul continued his dangerous journey"
            ],
            translations: ["Опасный", "Небезопасный"]
        ),
        .init(
            word: "Depressed",
            transcription: "[dɪˈprest]",
            examples: [
                "\"I think it's our fellow travelers who depress me,\" said Sarah. It's awful, isn't it, but I do hate women!",
                "You remind me of me when I was younger, depressed and sullen",
                "Don't depress the kids"
            ],
            translations: ["Подавленный"]
        ),
        .init(
            word: "Depression",
            transcription: "[dɪˈpreʃn]",
            examples: [
                "Perhaps allied to this overall depression was the fact that the room was almost silent",
                "He walked round the precincts slowly, and a profound depression seized him",
                "Every depression leads to war"
            ],
            translations: ["Депрессия"]
        ),
        .init(
            word: "Disappointed",
            transcription: "[dɪsəˈpɔɪntɪd]",
            examples: [
                "It'll only disappoint you when we catch him",
                "I can't disappoint her, because I'm always disappointing her!",
                "Alexandra did not enjoy parties, but she always pretended she was having a good time in order not to disappoint her grandmother"
            ],
            translations: ["Расстроенный"]
        ),
        .init(
            word: "Distant",
            transcription: "[ˈdɪstənt]",
            examples: [
                "Even the pounding of the rotors had faded to a distant hum",
                "For a split second, the most distant flame caught her attention",
                "In the meantime young Daniel had been sent to live with a distant relative in Texas, Aunt Mattie, whom he had never met"
            ],
            translations: ["Отстраненный"]
        ),
        .init(
            word: "Dreamy",
            transcription: "[ˈdriːmɪ]",
            examples: [
                "His thin dark face had become animated, his eyes had lost their mocking expression and grown almost dreamy",
                "The Dean's office looked like a chapel, a pool of dreamy twilight fed by one tall window of stained glass",
                "The one who caused her the most worry was Sascha, Mikhail's son, a handsome lad, dreamy and book-loving"
            ],
            translations: ["Мечтательный"]
        ),
        .init(
            word: "Daydreaming",
            transcription: "[ˈdeɪdriːmɪŋ]",
            examples: [
                "So I'm stuck with all your daydreaming, your wish to be my son",
                "Gregory Halston sat in his office lost in a daydream. Fate had placed in his hands a man who was so besotted with his blond tart",
                "Cornusse, it is my opinion that Catherine finds too many distractions here that cause her to daydream"
            ],
            translations: ["Мечтательность"]
        ),
        .init(
            word: "Empty",
            transcription: "[ˈemptɪ]",
            examples: [
                "For some vague matter of personal vanity, for some empty conceit",
                "He put the boat on automatic pilot, took one last look around the empty horizon and walked over to the lee railing",
                "We could empty bedpans, or wash cadavers"
            ],
            translations: ["Опустошенный"]
        ),
        .init(
            word: "Energetic",
            transcription: "[enəˈʤetɪk]",
            examples: [
                "In some respects, he was so like the Cowperwood of old, energetic, cordial, and not a little managerial",
                "I grew up in a very energetic, happy puerto rican family",
                "I knew your energetic nature, and that you would not be happy until you had been on the scene of the crime"
            ],
            translations: ["Энергичный"]
        ),
        .init(
            word: "Excited",
            transcription: "[ɪkˈsaɪtɪd]",
            examples: [
                "Not knowing his secret it was cruel mockery that she should for the first time excite his animosity when she had taken his surname",
                "His face was pale and there were beads of perspiration on his forehead. His eyes were curiously excited",
                "Rosamond enjoyed not only Lydgate's presence but its effect: she liked to excite jealousy"
            ],
            translations: ["Взволнованный"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .emotions, typeTranslation: .enToRu)
    return bagOfGold
}
