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
            transcription: "[əˈbɪlɪtɪ]",
            examples: [
                "He was starting to fear he had overestimated the media's ability to connect the obvious dots",
                "My ability to protect you becomes limited once we involve the White House",
                "But this nonsense, while annoying, in no way affects my ability to do my job"
            ],
            translations: ["Способность", "Возможность"]
        ),
        .init(
            word: "Accurate",
            transcription: " [ˈækjərət]",
            examples: [
                "All descriptions of artwork, architecture, documents, and secret rituals in this novel are accurate",
                "You deem report from northern efforts accurate?",
                "If you and your psycho friends want to worship me, then you might as well have some decent pictures and accurate info"
            ],
            translations: ["Точный"]
        ),
        .init(
            word: "To affect",
            transcription: "[tuː ˈæfekt]",
            examples: [
                "Robin, your revertigo is really starting to affect your work",
                "Your presence here has already begun to affect the entire balance of our society",
                "He was about to make a decision that was going to affect him, us, and his client, and I just pointed that out to him"
            ],
            translations: ["Воздействовать"]
        ),
        .init(
            word: "Amount of data",
            transcription: "[əˈmaʊnt ɒv ˈdeɪtə]",
            examples: [
                "They're downloading a massive amount of data and transmitting it",
                "It's transmitting a tremendous amount of data",
                "Granted, there's no shortage of huge corporations with vast amounts of data, but it's highly risky"
            ],
            translations: ["Объем данных", "Количество данных"]
        ),
        .init(
            word: "Approximately",
            transcription: "[əˈprɒksɪmɪtlɪ]",
            examples: [
                "This morning at approximately 4 a.m. the Hetman shamefully abandoned us all to our fate and ran away!",
                "He spoke not exactly so, perhaps; but in any case, approximately in that manner",
                "Ten minutes and four flares later, Rachel and the others were approximately 250 yards from the habisphere"
            ],
            translations: ["Приблизительно"]
        ),
        .init(
            word: "To attain",
            transcription: " [əˈteɪn]",
            examples: [
                "But through these five years of death-in-life I managed to attain freedom such as few men have ever known",
                "Murdering others to feed my desire for closure that I haven't been able to attain?",
                "He felt that if ever he wished to attain Berenice he must persuade Aileen to divorce him"
            ],
            translations: ["Достигать"]
        ),
        .init(
            word: "Available",
            transcription: "[əˈveɪləbl]",
            examples: [
                "There were a half-dozen available candidates, any one of whom would have rejoiced to step into his shoes",
                "Shortly after we had been caged the amphitheater began to fill and within an hour every available part of the seating space was occupied",
                "make (someone or something) available to (one)"
            ],
            translations: ["Доступный"]
        ),
        .init(
            word: "Broadband connection",
            transcription: "[ˈbrɔːdbænd kəˈnekʃn]",
            examples: [],
            translations: ["Выделенное подключение"]
        ),
        .init(
            word: "To browse",
            transcription: " [braʊz]",
            examples: [
                "You want to browse among my books, the pawnshop's just around the corner",
                "I shan't even browse",
                "Why don't you browse for a while?"
            ],
            translations: ["Просматривать"]
        ),
        .init(
            word: "Browser",
            transcription: "[ˈbraʊzə]",
            examples: [
                "- I have a similar question about browser histories",
                "I'll hack his browser history",
                "We checked your browser history on your office computer"
            ],
            translations: ["Браузер", "Окно просмотра"]
        ),
        .init(
            word: "To carry out",
            transcription: "",
            examples: [
                "His job was to carry out her orders",
                "I advise you to persuade your friend not to carry out this pointless plan",
                "You need to carry out a small investigation, discreet but thorough"
            ],
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
            examples: [
                "As he advances, the ice starts to crack",
                "Even now you kind of expect it to crack open, don't you?",
                "He doesn't try to crack the nut straight away, but drops it to the ground"
            ],
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
            examples: [
                "\"Yes,\" the agent said. \"It looks like data has been collected for over a year now.\" Collet read the list again, speechless",
                "So he could access our data for Tracy's address",
                "Absorption of data most satisfactory, master"
            ],
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
            transcription: "[saʊnd kɑːd]",
            examples: [
                "- Sounds like a card",
                "Yeah, that does sound like card counting"
            ],
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
            examples: [
                "Uh, a computer mouse or a live mouse?",
                "You should put a computer mouse instead of a wheel in your car",
                "The gun and the computer mouse are very similar"
            ],
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
        .init(
            word: "Computer program",
            transcription: "[kəmˈpjuːtə ˈprəʊgræm]",
            examples: [
                "I'm not talking to some computer program",
                "I will prepare a computer program that will limit their actions",
                "How can a computer program be inside a human brain?"
            ],
            translations: ["Компьютерная программа"]
        ),
        .init(
            word: "Interrupt controller",
            transcription: " [ɪntəˈrʌpt kənˈtrəʊlə]",
            examples: [],
            translations: ["Контроллер прерываний"]
        ),
        .init(
            word: "Drive controller",
            transcription: "[draɪv kənˈtrəʊlə]",
            examples: [
                "We need you to finish the neutron controller",
                "But the Controller would know",
                "The Controller die?"
            ],
            translations: ["Контроллер привода"]
        ),
        .init(
            word: "Cache memory",
            transcription: "[kæʃ ˈmemərɪ]",
            examples: [
                "The defendant's Snipcam cache was always in the discovery, Your Honor",
                "But I had my little cache",
                "Part of a cache we found in a culvert near where we took those prisoners"
            ],
            translations: ["Кэш", "Сверхоперативная память"]
        ),
        .init(
            word: "Desktop case",
            transcription: "",
            examples: [
                "I also saw a file on her desktop labelled Charlotte DiLaurentis",
                "- Playing desktop cornhole",
                "'You mean cases like the Bravo case, Adelaide Bartlett and all the rest of them?'"
            ],
            translations: ["Корпус с горизонтальным рабочим положением"]
        ),
        .init(
            word: "Router",
            transcription: "[ˈruːtə]",
            examples: [
                "And I am not gonna let it beat me like that wireless router did",
                "You'll need to install the time router",
                "They use a Tor network, which is an onion router"
            ],
            translations: ["Маршрутизатор"]
        ),
        .init(
            word: "Motherboard",
            transcription: "[ˈmʌðəbɔːd]",
            examples: [
                "That could've been my motherboard lying in the street!",
                "And the specific layout of the metal prongs on its motherboard match her wounds exactly",
                "This man, whoever he was, replaced the motherboard"
            ],
            translations: ["Материнская плата"]
        ),
        .init(
            word: "Microprocessor",
            transcription: "[maɪkrə(ʊ)ˈprəʊsesə]",
            examples: [
                "The microprocessor became redundant in the year 2019, replaced by a system called",
                "Apparently there was frost on the loading dock at our microprocessor plant in Acton",
                "And, you know, she could fry the microprocessor in here"
            ],
            translations: ["Микропроцессор"]
        ),
        .init(
            word: "Modem",
            transcription: "[ˈməʊdem]",
            examples: [
                "It reminds me of watching pictures download on our old dial-up modem",
                "There's just the modem line for the computers",
                "It's about time this paper had a modem, liberal, progressive policy!"
            ],
            translations: ["Модем"]
        ),
        .init(
            word: "Monitor",
            transcription: "[ˈmɒnɪtə]",
            examples: [
                "The technician produced a rolling stool and positioned Rachel in front of a flat-screen monitor",
                "I was going to make you a monitor next term, but I think I'd better wait a bit",
                "Yeah, see once my heart rate hits 120, that's the signal to transmit the image on every frequency and on every monitor within 100 feet"
            ],
            translations: ["Монитор"]
        ),
        .init(
            word: "Algorithm",
            transcription: "[ˈælgərɪðm]",
            examples: [
                "We use a proprietary trading algorithm",
                "I'm hoping to extract an algorithm to define their movement",
                "The core compression algorithm is optimal"
            ],
            translations: ["Алгоритм"]
        ),
        .init(
            word: "Analog",
            transcription: "[ˈænəlɒg]",
            examples: [
                "It all comes together into disturbingly accurate analog of human skin",
                "Remember those analog units we used to use to pull cell numbers out of the air?",
                "The Eye of Sauron is the near perfect analogue for the modern media"
            ],
            translations: ["Аналог", "Аналоговое"]
        ),
        .init(
            word: "App",
            transcription: "[æp]",
            examples: [
                "These examples will teach the app to actually anticipate the negative consequences of impulsive posts",
                "You know what, I have a translation app on my phone",
                "Does the app know you ate half a kilo of gnocchi in 30 seconds?"
            ],
            translations: ["Приложение", "Программа"]
        ),
        .init(
            word: "Array",
            transcription: "[əˈreɪ]",
            examples: [
                "London is now ringed by the most comprehensive array of surveillance cameras mankind has ever seen",
                "And as exquisite as this array of emotions is... even more sublime is the ability to turn it off",
                "We represent an array of American companies including Miller Beer"
            ],
            translations: ["Массив", "Набор"]
        ),
        .init(
            word: "Application",
            transcription: "[æplɪˈkeɪʃn]",
            examples: [
                "It must be remembered that by \"business\" Caleb never meant money transactions, but the skilful application of labor",
                "That's weird, 'cause I found your application in the trash folder of Allan's computer",
                "This application should never have been defended"
            ],
            translations: ["Приложение", "Прикладная программа"]
        ),
        .init(
            word: "Backup",
            transcription: "[ˈbækʌp]",
            examples: [
                "Well, I'm going to perform a full backup, reinitialize and then reinstall all my operating systems",
                "It's full of redundancies and backups developed with the help of ex-thieves",
                "We just lost our backup"
            ],
            translations: ["Резервная копия", "Копия"]
        ),
        .init(
            word: "Bit",
            transcription: "[bɪt]",
            examples: [
                "Pump him for every bit of information that you can",
                "64- bit core processor",
                "Binary digit"
            ],
            translations: ["Бит", "Разряд"]
        ),
        .init(
            word: "Binary",
            transcription: "[ˈbaɪnərɪ]",
            examples: [
                "Like binary code but instead of just having zeros and ones, you have zeros, ones and twos",
                "Because 127 in binary code would be a palindrome",
                "A binary vascular system!"
            ],
            translations: ["Двоичный", "Бинарный"]
        ),
        .init(
            word: "Bitmap",
            transcription: "[ˈbɪtmæp]",
            examples: [],
            translations: ["Растровый", "Точечный"]
        ),
        .init(
            word: "Bug",
            transcription: "[buːg]",
            examples: [
                "'He said it looked like a bed bug, monsieur, but not so that the mechanics could hear what he said",
                "And this bug mutated as a direct result of our mass consumption of animals, particularly pork",
                "I think I've had a bug, or something"
            ],
            translations: ["Ошибка", "Глюк", "Баг"]
        ),
        .init(
            word: "Compile",
            transcription: "[kəmˈpaɪl]",
            examples: [
                "And once I compile the data, finding Mr. Right will be a cinch",
                "I still have to compile the particulates from the obelisk, so...",
                "I just need access to wherever they compile all the available data..."
            ],
            translations: ["Компилировать", "Собрать"]
        ),
        .init(
            word: "Cache",
            transcription: "[kæʃ]",
            examples: [
                "And if I did, I know how to scrub a search cache clean",
                "It is decentralized, cached on servers all over the world",
                "Well, I can pretty much say I've never cleaned my cache"
            ],
            translations: ["Кэш", "Кеширование", "Тайник"]
        ),
        .init(
            word: "Captcha",
            transcription: "[ˈkæpʧə]",
            examples: [],
            translations: ["Капча"]
        ),
        .init(
            word: "Cloud computing",
            transcription: "[klaʊd kəmˈpjuːtɪŋ]",
            examples: [],
            translations: ["Облачные вычисления"]
        ),
        .init(
            word: "Cybercrime",
            transcription: "[saɪbəˈkraɪm]",
            examples: [
                "I spent seven years at cybercrimes tracking you, studying your work",
                "Chief strategy officer, cybercrimes unit-- catches hackers for the NSA",
                "Cybercrime division, Oslo"
            ],
            translations: ["Киберпреступность"]
        ),
        .init(
            word: "Cookie",
            transcription: "[ˈkʊkɪ]",
            examples: [
                "While she carried the cookie plate and the teapot, he followed with the cups and saucers, back into the living room",
                "You can't be seen anywhere near that video, Cookie",
                "Cookie Monster could have invented Facebook!"
            ],
            translations: ["Файл cookie", "Печенька"]
        ),
        .init(
            word: "Command",
            transcription: "[kəˈmɑːnd]",
            examples: [
                "It but remains for this council to command, and Tal Hajus must prove his fitness to rule",
                "\"Go home!\" came the sharp command, and this time he obeyed",
                "Mrs Crale was quite in command of herself"
            ],
            translations: ["Команда", "Приказ"]
        ),
        .init(
            word: "Clip art",
            transcription: "[klɪp ɑːt]",
            examples: [],
            translations: ["Картинка", "Клипарт"]
        ),
        .init(
            word: "Dashboard",
            transcription: "[ˈdæʃbɔːd]",
            examples: [
                "She kept her eyes on the road, but the dashboard on the rim of her vision looked like the panel of an airplane",
                "The steering wheel comes out of the dashboard at an angle",
                "It even has a button marked \"Race\" on the dashboard"
            ],
            translations: ["Приборная панель", "Панель инстурментов"]
        ),
        .init(
            word: "Database",
            transcription: "[ˈdeɪtəbeɪs]",
            examples: [
                "Lost my database of his acquaintances",
                "Run through database for possible criminal background",
                "In return, he saved me to a database in the biggest library in the universe"
            ],
            translations: ["База данных", "БД"]
        ),
        .init(
            word: "Domain",
            transcription: "[dəˈmeɪn]",
            examples: [
                "Left alone while Rob sped back to his suspicious Missus, Meggie unpacked and surveyed her domain",
                "So he lived long enough to see some of his songs go into the public domain",
                "How does your brain feel about calculating the surface tension of the domain walls?"
            ],
            translations: ["Домен", "Область"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .computers, typeTranslation: .enToRu)
    return bagOfGold
}
