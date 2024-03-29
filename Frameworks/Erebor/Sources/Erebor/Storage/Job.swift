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
            examples: [
                "Many covert glances came our way and only Edwina, who sat with us, seemed at ease in our company",
                "Six months ago Romano got in touch with your mother and said he wanted to buy the company",
                "Between you and me there's going to be a big new gas company in the field"
            ],
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
            examples: [
                "Mrs. Elsing hated to take his money--\"speculator money\"--but the Association needed money badly",
                "I've got no ambition at all. The only thing I want to do after the war is marry some girl who's got more money than I have and shack up with lots more pretty girls",
                "We want you badly and we think that this amount of money expresses that desire"
            ],
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
            examples: [
                "The entire area was dark except for an office on the far side of the lab, where a light shone under the door",
                "In the outer office, the three girls were preparing to leave",
                "I understand that the United States Patent Office has granted a patent on this?"
            ],
            translations: ["Офис"]
        ),
        .init(
            word: "Policy",
            transcription: "[ˈpɒlɪsi]",
            examples: [
                "That doesn't mean we have to abandon good policy",
                "\"Only an insurance policy will make your life completely worry-free,\" replied Ostap without slowing down",
                "China has received more United Nations Awards for it's policies - and form of governance than any other nation"
            ],
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
            examples: [
                "He was almost to the control panel",
                "- They wanna kick her out to get out of rent control, and now that we've missed the deadline, there's nothing we can do about it",
                "She must have escaped from under control, Nikon Semyonitch went on, dropping his voice, and glancing significantly at Varvara Petrovna"
            ],
            translations: ["Контроль"]
        ),
        .init(
            word: "Report",
            transcription: "[rɪˈpɔːt]",
            examples: [
                "We just issued our annual report for the meat-packing company, fellas. Our profits are up forty percent",
                "Mr. Garrett, you must turn in a full report, mustn't you?",
                "Glick groaned. He could hear the news anchor already. \"Thanks Gunther, great report\""
            ],
            translations: ["Отчет", "Доклад"]
        ),
        .init(
            word: "Site",
            transcription: "[saɪt]",
            examples: [
                "The site for your book",
                "Hodgins found bronze particulates at the site",
                "Probably why the device was stored off- site for safe-keeping"
            ],
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
            examples: [
                "Cleon looked up and, with an obvious effort, managed to smile",
                "Now if you strive and make a great effort, some day you'll rise to the level of that play!",
                "Then, the body would make a final effort to conserve its remaining heat by shutting down all operations except the heart and respiration"
            ],
            translations: ["Усилие", "Труд"]
        ),
        .init(
            word: "Action",
            transcription: "[ækʃn]",
            examples: [
                "He watched as she left. The minute she was gone, George went into action",
                "And \"force\" is action of one body on another applied by means of energy",
                "He did not see the time was not ripe for vigorous action"
            ],
            translations: ["Действие"]
        ),
        .init(
            word: "Activity",
            transcription: "[ækˈtɪvɪtɪ]",
            examples: [
                "The fifth monster was taking no part in this activity",
                "Yeah, a bunch of strange activity from the company's server caught the attention of the S.E.C.",
                "It's a laborious activity because I have to imagine what you need, whereas you know what you need"
            ],
            translations: ["Деятельность"]
        ),
        .init(
            word: "Practice",
            transcription: "[ˈpræktɪs]",
            examples: [
                "- And practice, practice, practice",
                "I was doing well enough but was young and had had practice in how to visit Terra and stay alive",
                "Not some farming practice that's hidden away in the sonnets?"
            ],
            translations: ["Практика", "Деятельность"]
        ),
        .init(
            word: "Skill",
            transcription: "[skɪl]",
            examples: [
                "This was the least difficult job of all and the one classically requiring no skill",
                "Your feeble skills are no match for the power of the dark side",
                "Philip felt a little inclined to pat himself on the back for his skill in managing the business"
            ],
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
                "Half day off",
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
        .init(
            word: "Target",
            transcription: "[ˈtɑːgɪt]",
            examples: [
                "Especially when the target was a high-profile official",
                "Victor Racine was our target... until one day, Ike didn't come into work",
                "Well, it seems I'm still on target for my appointment 20 years from now"
            ],
            translations: ["Цель"]
        ),
        .init(
            word: "Tool",
            transcription: "[tuːl]",
            examples: [
                "I'm only your tool of self-destruction I know all that, I accept it and I want you to marry me",
                "The ultimate surveillance tool, Delta-One thought, still amazed every time they powered it up",
                "Loyalty is a tool to get people to do things they don't wanna do"
            ],
            translations: ["Инструмент"]
        ),
        .init(
            word: "Leadership",
            transcription: "[ˈliːdəʃɪp]",
            examples: [
                "If I'm ever supposed to be this great military leader... maybe you should start listening to my leadership ideas once in a while",
                "It's that kind of leadership that's putting you at the head of the pack",
                "She's been on me for years to come back to Boston and take a leadership role in the Harper Avery foundation"
            ],
            translations: ["Руководство", "Лидерство"]
        ),
        .init(
            word: "Procedure",
            transcription: "[prəˈsiːʤə]",
            examples: [
                "You may know more about making whiskey or love than I do, but I know more about criminal procedure than you, remember",
                "I found the procedure in the study of rare diseases by Archmaester Pylos",
                "Interested in learning a procedure that could save your life?"
            ],
            translations: ["Процедура", "Порядок выполнения действий"]
        ),
        .init(
            word: "Document",
            transcription: "[ˈdɒkjʊmənt]",
            examples: [
                "Then he pulled out his wallet from his hip pocket, opened with the deliberation of age, and studied a document",
                "You cohabitate with one of the foremost forensic document examiners on the planet",
                "Evidently our suspect used it to document the progression of the disease"
            ],
            translations: ["Документ"]
        ),
        .init(
            word: "Contacts",
            transcription: "[ˈkɒntækts]",
            examples: [
                "The news about the chondrules was almost as discomforting as Rachel's news about her attempted contact with Pickering",
                "He immediately cleared his schedule, and he's been in close contact with NASA ever since",
                "There's this stuff called urushiol, it's in the sap, it spreads by contact"
            ],
            translations: ["Контактные данные"]
        ),
        .init(
            word: "Progress",
            transcription: "[ˈprəʊgrəs]",
            examples: [
                "Kate had watched the progress of Alexandra's romance with Peter Templeton with a great deal of interest",
                "Drops of red and green light flashed on a wall board, signaling the progress of cars high in space",
                "The stick still fell; as the progress of the horse slowed, the speed of the stick increased in exact ratio"
            ],
            translations: ["Прогресс"]
        ),
        .init(
            word: "Application",
            transcription: "[ˌæplɪˈkeɪʃ(ə)n]",
            examples: [
                "When the Sessions came round, Mr. Jaggers caused an application to be made for the postponement of his trial until the following Sessions",
                "It must be remembered that by \"business\" Caleb never meant money transactions, but the skilful application of labor",
                "Before an application is released, they give it a trial run",
            ],
            translations: ["Заявка", "Прикладной"]
        ),
        .init(
            word: "Instruction",
            transcription: "[ɪnˈstrʌkʃən]",
            examples: [
                "But yes, I will do that to myself at your instruction",
                "Yet the mother confided his whole instruction and moral education to Stepan Trofimovitch",
                "At her instruction I put my arms around her waist, and pressed my chest against her back"
            ],
            translations: ["Инструкция", "Руководство"]
        ),
        .init(
            word: "Instrument",
            transcription: "[ˈɪnstrʊmənt]",
            examples: [
                "This was presently being rotated by the monster, which pressed one of its bland, saucer-like eyes to a sighting instrument",
                "Everyone was staring at Tracy. She said, \"I... you didn't sterilize that instrument\"",
                "The instrument looked like three miniature snowplow blades that had been affixed in parallel to an aluminum frame",
            ],
            translations: ["Инструмент", "Прибор"]
        ),
        .init(
            word: "File",
            transcription: "[faɪl]",
            examples: [
                "She entered, flicked on the fluorescent lights, and strode directly to her file cabinets",
                "Just like old Luccheni, if you remember, who stabbed our late lamented Elizabeth with a file",
                "Unlock Special File Zebra"
            ],
            translations: ["Файл", "Документ", "Личное дело"]
        ),
        .init(
            word: "Outcome",
            transcription: "[ˈaʊtkʌm]",
            examples: [
                "I have not pushed it to the length of getting into a box to think, but that is the logical outcome of my convictions",
                "But are you seriously suggesting that this machine can predict the outcome of a revolution?",
                "Rachel felt pleased with the outcome of her briefing of the White House staff",
            ],
            translations: ["Итог", "Результат"]
        ),
        .init(
            word: "Duty",
            transcription: "[ˈdjuːti]",
            examples: [
                "Tell her father that as soon as she has done her duty by her husband and child she shall go to see him",
                "I told him to get me out of the duty of army, but he said he will send me to 7 years duty unit",
                "Mrs. Vanderlake knew where her duty lay",
            ],
            translations: ["Долг", "Должностная обязанность"]
        ),
        .init(
            word: "Manner",
            transcription: "[ˈmænə]",
            examples: [
                "Your honor, I object to the whole manner in which this examination is being conducted by the prosecution",
                "It was a great, rambling, two-story affair, done after the manner of the French chateaux, but in red brick and brownstone",
                "Sir, your manner is deeply inappropriate"
            ],
            translations: ["Способ выполнения действия"]
        ),
        .init(
            word: "Requirement",
            transcription: "[rɪˈkwaɪəmənt]",
            examples: [
                "Have you ever speculated, Mr. Harding, that perhaps you are impatient with your wife... because she doesn't meet your mental requirements?",
                "If you want my help, then going to meetings is my one requirement",
                "Three requirements distinguish the professional escapist from the amateur"
            ],
            translations: ["Требование"]
        ),
        .init(
            word: "Copy",
            transcription: "[ˈkɒpi]",
            examples: [
                "Not copy the Dana Building, but design it as Henry Cameron would have wanted it done, as I will",
                "I will write to your dictation, or I will copy and extract what you tell me: I can be of no other use",
                "Copy me a line or two of that valuation, with the figures at the end"
            ],
            translations: ["Копия", "Экземпляр книги"]
        ),
        .init(
            word: "Tips",
            transcription: "[tɪps]",
            examples: [
                "General Peckem lifted a wooden pointer and swept the rubber tip cheerfully across Italy from one coast to the other",
                "The tip of his boot was shredded, and the front of his big toe had been sheared off",
                "Then he felt the tip of the stick connect with his heel"
            ],
            translations: ["Чаевые"]
        ),
        .init(
            word: "Achievement",
            transcription: "[əˈʧiːvmənt]",
            examples: [
                "",
            ],
            translations: ["Достижение"]
        ),
        .init(
            word: "Characteristic",
            transcription: "[ˌkærɪktəˈrɪstɪk]",
            examples: [
                "And he went on to develop his pet theory that the significance of a title unaccompanied by personal achievement was little",
                "And as for the Cosmo-Slotnick Building, who can deny that it's an extraordinary achievement?",
                "The achievements of the revolution, and so on ..."
            ],
            translations: ["Характеристика", "Черта"]
        ),
        .init(
            word: "Signal",
            transcription: "[ˈsɪgnl]",
            examples: [
                "The machine, detecting no data signal, had switched to its answering machine feature",
                "For starters, a mysterious hiss was interfering with their radio signal",
                "I can write an algorithm that can bypass the signal traps"
            ],
            translations: ["Сигнал", "Знак"]
        ),
        .init(
            word: "Agenda",
            transcription: "[əˈʤɛndə]",
            examples: [
                "The first item on the agenda is to elect a president and treasurer of the company to replace the late Jonas Cord",
                "So he sets the agenda, same as always",
                "House always has an agenda"
            ],
            translations: ["Повестка дня"]
        ),
        .init(
            word: "Schedule",
            transcription: "[ˈʃɛdjuːl]",
            examples: [
                "Puzzled, the manager checked his delivery schedule. It's here. Downstairs at the loading dock",
                "Ippolit Matveyevich's initiative was allotted a fair share of the work schedule",
                "No, you just have her entire schedule memorized for fun"
            ],
            translations: ["График работы", "Расписание"]
        ),
        .init(
            word: "Print",
            transcription: "[prɪnt]",
            examples: [
                "You get satnav, but you print it out into a booklet that you can just flick through",
                "The only thing you could print on this is letterheads",
                "Leonel was gonna print them for me"
            ],
            translations: ["Печать", "Отпечаток"]
        ),
        .init(
            word: "Stamp",
            transcription: "[stæmp]",
            examples: [
                "Why do you want to know what Mr. Stevens and I discussed? Are you a rival stamp collector?",
                "There's no stamp, so it must have been hand-delivered from some guy",
                "And he loved this ennobling stamp on his verses"
            ],
            translations: ["Печать", "Штамп"]
        ),
        .init(
            word: "Pass",
            transcription: "[pɑːs]",
            examples: [
                "Then we will pass to the Red Room, where Dolley Madison liquored up visiting heads of state before James Madison negotiated with them",
                "If you knuckle down and pass examinations a year early, why, I'll help you through college",
                "Pass on to the next head-I omit the second excursus on Crete"
            ],
            translations: ["Пропуск", "Пасс"]
        ),
        .init(
            word: "Employer",
            transcription: "[ɪmˈplɔɪə]",
            examples: [
                "You have a small following of your own, but no prospective employer can withstand the kind of pressure I am in a position to exert",
                "Although his employer had never revealed his face, the killer felt honored to be in his presence",
                "Look, I know that Khan is going to lead me to his employer"
            ],
            translations: ["Работодатель", "Заказчик"]
        ),
        .init(
            word: "Prospect",
            transcription: "[ˈprɒspɛkt]",
            examples: [
                "Furthermore, the prospect of returning to work the next day was one I greeted with the utmost despondency",
                "Towards evening, just before it got dark, I was walking along the Voznesensky Prospect",
                "I would rather never have seen you than think of you with such a prospect"
            ],
            translations: ["Перспектива"]
        ),
        .init(
            word: "Entry",
            transcription: "[ˈɛntri]",
            examples: [
                "It is not known... how many office robberies occur every second, cause there is no wikipedia entry for office robbery statistics",
                "The sentry led her to a desk and handed her a pen. \"Please sign the entry log\"",
                "May I present a late entry to the joust"
            ],
            translations: ["Запись"]
        ),
        .init(
            word: "Disorder",
            transcription: "[dɪsˈɔːdə]",
            examples: [
                "The first thing he saw was the disorder in the street lantern whose rope had been cut",
                "Berlaga has a very serious mental illness, the heel nerve disorder",
                "Mr. Kenneth was perplexed to pronounce of what disorder the master died"
            ],
            translations: ["Беспорядок", "Нарушение"]
        ),
        .init(
            word: "Distribution",
            transcription: "[ˌdɪstrɪˈbjuːʃən]",
            examples: [
                "I talked to people involved in the sales and distribution of stationery, I talked to farmers, Army people, Colonel Kurtz",
                "Disney, Goldwyn and Bonner were all looking for new distribution outlets",
                "Creation comes before distribution - or there will be nothing to distribute"
            ],
            translations: ["Распределение", "Распространение"]
        ),
        .init(
            word: "Command",
            transcription: "[kəˈmɑːnd]",
            examples: [
                "Sergeant Malloy put his whistle to his lips and blew a shrill blast up and down the company lines; the captain shouted his forward command",
                "Well, apparently, my command of the English language has not been dulled by the ravages of time",
                "Thanks to your High Command, it's been a rather nasty day"
            ],
            translations: ["Команда", "Приказ"]
        ),
        .init(
            word: "Veteran",
            transcription: "[ˈvɛtərən]",
            examples: [
                "She was a veteran too, but she had no cronies with whom she could refight old battles",
                "Foreman is currently working with two of House's most veteran associates",
                "I met this guy who...in America, and he was a Vietnam veteran"
            ],
            translations: ["Ветеран"]
        ),
        .init(
            word: "Plumber",
            transcription: "[ˈplʌmə]",
            examples: [
                "Oh, I've been an electrician, and a plumber, and a rivet catcher, and many other things",
                "Anything that requires flames--plumbers, electricians, welders"
            ],
            translations: ["Сантехник", "Водопроводчик"]
        ),
        .init(
            word: "Policeman",
            transcription: "[pəˈliːsmən]",
            examples: [
                "That policeman who had only just sent him to the front of the queue was already lifting a hand to take him to one side",
                "A uniformed policeman appeared from nowhere. Hold it! What do you think you're doing?"
            ],
            translations: ["Полицейский", "Полицай"]
        ),
        .init(
            word: "Photographer",
            transcription: "[fəˈtɒgrəfə]",
            examples: [
                "Actually, Peter Parker was a news photographer",
                "The odd thing was that in civilian life Hungry Joe really had been a photographer for Life magazine"
            ],
            translations: ["Фотограф"]
        ),
        .init(
            word: "Hairdresser",
            transcription: "[ˈheədresə]",
            examples: [
                ""
            ],
            translations: [""]
        ),
        .init(
            word: "Judge",
            transcription: "[ʤʌʤ]",
            examples: [
                "Hell, I tip my hairdresser that. The woman guffawed",
                "I need this story coming out of every TV, phone, laptop, and hairdresser in America",
                "Fabian, my hairdresser"
            ],
            translations: ["Парикмахер", "Стилист"]
        ),
        .init(
            word: "Lawyer",
            transcription: "[ˈlɔːjə]",
            examples: [
                "Nor would he have spoken to Mike; Warden was political lawyer before exile, knew nothing about computers",
                "He's a corporation lawyer"
            ],
            translations: ["Юрист", "Адвокат"]
        ),
        .init(
            word: "Nurse",
            transcription: "[nɜːs]",
            examples: [
                "She was a nurse in 1913, and she fell in love with this man called John Smith",
                "The nurse took him to the nursery so you could get some sleep",
                "Thanks, Nurse"
            ],
            translations: ["Медсестра", "Няня", "Санитар"]
        ),
        .init(
            word: "Optician",
            transcription: "[ɒpˈtɪʃn]",
            examples: [
                "So when I went for an eye test the optician said, Can you see the Great wall of China?",
                "When are you going to get yourself to an optician?",
                "Eye to eye with optician van Laren?"
            ],
            translations: ["Оптик", "Окулист"]
        ),
        .init(
            word: "Porter",
            transcription: "[ɒpˈtɪʃn]",
            examples: [
                "What's in those packages? I asked him, pointing to the long thin parcels the porter had given him",
                "When Sheila had gone, I went across to the Clarendon, packed my bag and left it ready with the porter",
                "There's no porter there, and nobody knows whether tenants are in or out"
            ],
            translations: ["Носильщик", "Грузчик"]
        ),
        .init(
            word: "Postman",
            transcription: "[ˈpəʊstmən]",
            examples: [
                "It's only what the postman thinks - he's not sure",
                "Let the postman do it, then, Miss Reba said",
                "The letter will fall in as the postman comes along, then off!"
            ],
            translations: ["Почтальон", "Почтовик"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .job, typeTranslation: .enToRu)
    return bagOfGold
}
