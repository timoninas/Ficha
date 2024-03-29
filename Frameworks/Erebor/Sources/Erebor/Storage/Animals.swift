//
//  Animals.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldAnimals() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Stork",
            transcription: "[stɔːk]",
            examples: [
                "Grasp the bird's tail, become the white stork, repulse the monkey, face the tiger, let your hands become clouds and circulate the water of life",
                "Aunt Alexandra was standing stiff as a stork",
                "He was balancing on the boards like a stork with horn-rimmed glasses"
            ],
            translations: ["Аист"]
        ),
        .init(
            word: "Shark",
            transcription: "[ʃɑːk]",
            examples: [
                "The question now was whether this shark was an innocent bystander-or a player",
                "The best technique for a card shark is dealing from the bottom",
                "Introduce her to your loan shark?"
            ],
            translations: ["Акула"]
        ),
        .init(
            word: "Antelope",
            transcription: "[ˈæntɪləʊp]",
            examples: [
                "I was a man, eager and curious as the antelope when we lured it by waving grass clumps where we lay hidden in the thick of the grass",
                "It increased his caution; and he continued his approach with as much stealth, as if he had been stalking an antelope",
                "I could have torn him limb from limb, as the lion rends the antelope"
            ],
            translations: ["Антилопа"]
        ),
        .init(
            word: "Butterfly",
            transcription: "[ˈbʌtəflaɪ]",
            examples: [
                "She has a necklace of cornelian beads and one of bright royal blue beads and is wearing a brooch with a pearl butterfly on it",
                "He's just a butterfly, you know",
                "Honey, would you feel better... if I went out and gave that butterfly valve a twist now?"
            ],
            translations: ["Бабочка"]
        ),
        .init(
            word: "Ox",
            transcription: "[ɒks]",
            examples: [
                "But they couldn't touch him, he told Clevinger, because he had a sound mind in a pure body and was as strong as an ox",
                "He was warmed by the breathing of the ox",
                "A gas jet burned on the rough wall, the colour of ox blood"
            ],
            translations: ["Вол", "Бык"]
        ),
        .init(
            word: "Ram",
            transcription: "[ræm]",
            examples: [
                "The sleepy figures staggered into the Hotel France, and there came the bleating of a ram being dragged into the kitchen by the hind legs",
                "Although he did not hear it, every blow of the ram reverberated simultaneously in the vaults of the church and within it",
                "Ram, it is time for rehearsal"
            ],
            translations: ["Баран"]
        ),
        .init(
            word: "Badger",
            transcription: "[ˈbædʒə]",
            examples: [
                "An old, old man with a bent back came like a badger out of a tent and snooped near, sniffing the air as he came",
                "Badger me for 40 minutes in the hopes that I'll be distracted when you get to what you really care about",
                "Because we're married and I have certain rights, and one of them is the right to badger you",
            ],
            translations: ["Барсук"]
        ),
        .init(
            word: "Squirrel",
            transcription: "[ˈskwɪrəl]",
            examples: [
                "One day a neighbouring cat came to see her, and the squirrel was clearly the subject of their talk",
                "Silly Squirrel, do you know the probability of winning the lottery?",
                "-We're not stopping anyone from squirreling away 50 Seconal in the nightstand and washing it down with vodka"
            ],
            translations: ["Белка"]
        ),
        .init(
            word: "Polar bear",
            transcription: "[ˈpəʊlə beə]",
            examples: [
                "But this is polar bear country, right?",
                "Hot enough to burn a polar bear's butt",
                "Taken by a polar bear"
            ],
            translations: ["Белый медведь"]
        ),
        .init(
            word: "Ladybird",
            transcription: "[ˈleɪdɪbɜːd]",
            examples: [
                "Are you saying he was a ladybird, or some sort of...?",
                "Now, when would you go out with a bucketful of ladybirds?",
                "Would you like to see a ladybird?"
            ],
            translations: ["Божья коровка"]
        ),
        .init(
            word: "Beaver",
            transcription: "[ˈbiːvə]",
            examples: [
                "Grey Beaver got the thirst",
                "His buddies, Beaver and what's-his-name?",
                "My busy little beaver"
            ],
            translations: ["Бобр"]
        ),
        .init(
            word: "Bull",
            transcription: "[bʊl]",
            examples: [
                "A man, mercifully clad as a layman; one more red soutane, thought Justine, and I'll bellow like a bull",
                "I thought the Taurus was the bull",
                "What bull dropped that on the barn floor?"
            ],
            translations: ["Бык"]
        ),
        .init(
            word: "Mouse",
            transcription: "[maus]",
            examples: [
                "It's the most beautiful story ever told - next to that of Mickey and Minnie Mouse",
                "Mouse savior?",
                "He sat easily, carelessly but she felt that he was watching her as alertly as a cat watches a mouse hole"
            ],
            translations: ["Мышь"]
        ),
        .init(
            word: "Deer",
            transcription: "[diə]",
            examples: [
                "There were even more upstairs, with deer inside them drinking at water holes, and birds flying south for the winter",
                "The train was passing through the forest of Saint Germaine, and she had seen a frightened deer clear one of the paths at a bound",
                "Yes, it was very sad when the guy stopped drawing the deer"
            ],
            translations: ["Олень"]
        ),
        .init(
            word: "Lion",
            transcription: "['laiən]",
            examples: [
                "Wake up, Papa, a lion is coming",
                "You know the one about the mother lion and her little cub?",
                "She had the strength of a little lion too"
            ],
            translations: ["Лев"]
        ),
        .init(
            word: "Butterfly",
            transcription: "['bʌtəflai]",
            examples: [
                "She has a necklace of cornelian beads and one of bright royal blue beads and is wearing a brooch with a pearl butterfly on it",
                "Honey, would you feel better... if I went out and gave that butterfly valve a twist now?",
                "Her movements were as light and airy as those of a butterfly"
            ],
            translations: ["Бабочка"]
        ),
        .init(
            word: "Hippopotamus",
            transcription: "[,haipə'pɔtəməs]",
            examples: [],
            translations: ["Бегемот"]
        ),
        .init(
            word: "Rhinoceros",
            transcription: "[rai'nɔsərəs]",
            examples: [],
            translations: ["Носорог"]
        ),
        .init(
            word: "Snail",
            transcription: "[sneil]",
            examples: [],
            translations: ["Улитка"]
        ),
        .init(
            word: "Crocodile",
            transcription: "['krɔkədail]",
            examples: [],
            translations: ["Крокодил"]
        ),
        .init(
            word: "Cockroach",
            transcription: "['kɔkrəuʧ]",
            examples: [],
            translations: ["Таракан"]
        ),
        .init(
            word: "Cheetah",
            transcription: "['ʧi:tə]",
            examples: [],
            translations: ["Гепард"]
        ),
        .init(
            word: "Peacock",
            transcription: "['pi:kɔk]",
            examples: [
                "'For God's sake,' David protested to Kate. \"I feel like a damned peacock\"",
                "He admired the indescribably turquoise neck of the peacock, the metre-wide spread of its tail and its pink and gold fringe",
                "(as) proud as a peacock"
            ],
            translations: ["Павлин"]
        ),
        .init(
            word: "Parrot",
            transcription: "['pærət]",
            examples: [],
            translations: ["Попугай"]
        ),
        .init(
            word: "Duck",
            transcription: "[dʌk]",
            examples: [
                "Hams in wine, pressed duck, pate de foie gras, rare fruits in and out of season, were spread in profusion",
                "She went, like a lame duck, back through the long corridors; she stumbled over the familiar tiger skins in the dark hall",
                "Things just roll off you like water off a duck"
            ],
            translations: ["Утка"]
        ),
        .init(
            word: "Penguin",
            transcription: "['peŋgwin]",
            examples: [
                "Penguin or beaver?",
                "Pass me the telephone, Penguin",
                "A penguin with a sunburn"
            ],
            translations: ["Пингвин"]
        ),
        .init(
            word: "Swan",
            transcription: "[swɔn]",
            examples: [
                "I wouldn't have gone without you, and then I might never have seen that-that swan, that sunbeam, that thunderbolt!",
                "You remember Swan, don't you?",
                "The Black Swan is an inn of repute in the High Street, at no distance from the station, and there we found the young lady waiting for us"
            ],
            translations: ["Лебедь"]
        ),
        .init(
            word: "Fish",
            transcription: "[fiʃ]",
            examples: [
                "He wants the big fish",
                "The rooming house where Mallory lived was a dilapidated brownstone in an unlighted street that smelled of a fish market",
                "He was looking at Robert Jordan with his mouth closed so that his lips made a tight line, like the mouth of a fish, Robert Jordan thought"
            ],
            translations: ["Рыба"]
        ),
        .init(
            word: "Puppy",
            transcription: "['pʌpi]",
            examples: [],
            translations: ["Щенок"]
        ),
        .init(
            word: "Tortoise",
            transcription: "['tɔ:təs]",
            examples: [
                "I noticed that the platform was not raised to its full height, but crawled along just above the ground like an iron tortoise",
                "You act like you don't like me, like I killed your pet tortoise or something",
                "Buy with them a tortoise powder box with a gold setting for your mamma; and if you have a little sister, buy her a good doll"
            ],
            translations: ["Черепаха"]
        ),
        .init(
            word: "Goldfinch",
            transcription: "['gəʋldfɪntʃ]",
            examples: [],
            translations: ["Щегол"]
        ),
        .init(
            word: "Dolphin",
            transcription: "['dɔlfin]",
            examples: [
                "Having lost track of the Dolphin helicopter that was supposed to be in the area, they feared an accident",
                "I take back everything I said to you that night in the dolphin lab",
                "A school of dolphin five hundred strong"
            ],
            translations: ["Дельфин"]
        ),
        .init(
            word: "Dinosaur",
            transcription: "[ˈdaɪnəʊsɔː]",
            examples: [
                "Obviously space is the future, but NASA is a dinosaur!",
                "I'll take that big purple dinosaur, please",
                "Hey, dinosaur guy."
            ],
            translations: ["Динозавр"]
        ),
        .init(
            word: "Wolverine",
            transcription: "[ˈwʊlvəriːn]",
            examples: [
                "He did not know that it was a wolverine, standing outside, all a-trembling with its own daring",
                "I never called your mother a wolverine",
                "I will bite and scratch you like a wolverine"
            ],
            translations: ["Росомаха"]
        ),
        .init(
            word: "Puma",
            transcription: "[ˈpjuːmə]",
            examples: [
                "They were magnificent, vying with each other for the richest pelt: a lynx, a snow leopard, an ash-brown puma and a tawny jaguar with black spots",
                "Rolling did not offer his hand to either of them but glared out of the depths of the limousine like a puma in a cage",
                "Anyone know a good place if you're not dating a puma?"
            ],
            translations: ["Пума"]
        ),
        .init(
            word: "Cougar",
            transcription: "[ˈkuːgə]",
            examples: [
                "I even got a cougar once",
                "Hurrah!-Here we go like three tin kettles at the tail of a mad cougar!",
                "- They rid the state of cougars"
            ],
            translations: ["Пума"]
        ),
        .init(
            word: "Opossum",
            transcription: "[əˈpɒsəm]",
            examples: [
                "- Oh, can't we have opossum?",
                "That's a cat or opossum",
                "It's a opossum, and it died at least three to six years ago"
            ],
            translations: ["Опоссум"]
        ),
        .init(
            word: "Puma",
            transcription: "[ˈpjuːmə]",
            examples: [
                "Rolling did not offer his hand to either of them but glared out of the depths of the limousine like a puma in a cage",
                "A puma, the lion of the Andes",
                "- Purrs like a puma in heat"
            ],
            translations: ["Пума"]
        ),
        .init(
            word: "Cougar",
            transcription: "[ˈkuːgə]",
            examples: [
                "He crashed through the tree canopy there, and was presumably eaten by this cougar, who is still coughing up parts of the boy's clothes",
                "Hurrah!-Here we go like three tin kettles at the tail of a mad cougar!",
                "Tell you, I have a good mind to stay in a hotel until they catch that cougar"
            ],
            translations: ["Пума"]
        ),
        .init(
            word: "Wolverine",
            transcription: "[ˈwʊlvəriːn]",
            examples: [
                "I can keep sitting here pretending to read about Wolverine, or you can talk about what happened with Emma",
                "You dip a guy in brown gravy and lock him in a small room with a wolverine who's high on angel dust",
                "Someone will finish what we've started, Wolverine!"
            ],
            translations: ["Росомаха"]
        ),
        .init(
            word: "Dinosaur",
            transcription: "[ˈdaɪnəʊsɔː]",
            examples: [
                "He felt like a paleontologist coming face to face with a living dinosaur",
                "That's just a dinosaur toy down the street",
                "Hey, dinosaur guy"
            ],
            translations: ["Динозавр"]
        ),
        .init(
            word: "Colony (of ants, rabbits)",
            transcription: "[ˈkɒləni]",
            examples: [
                "The fungus is so virulent, it can wipe out whole colonies of ants and it's not just ants that fall victim to this killer",
                "And a colony of aggressive red ants looking for a ride",
                "A colony of ants all in a line"
            ],
            translations: ["Колония"]
        ),
        .init(
            word: "Swarm (of bees)",
            transcription: "[swɔːm]",
            examples: [
                "It looks more as if he'd been attacked by a swarm of bees, but that is supposed to indicate ladies and their husbands trying to restrain them",
                "Hung on the doors and running-boards like a swarm of bees",
                "It sounded like a swarm of bees here"
            ],
            translations: ["Рой"]
        ),
        .init(
            word: "Flock (of birds)",
            transcription: "[flɒk]",
            examples: [
                "Now it converts itself into a flock of birds, scatters itself to the four winds, and occupies all points of air and space at once",
                "We flew through a flock of birds, the clouds parted, then we entered His Kingdom",
                "I was watching the news, and another flock of birds fell out of the sky dead"
            ],
            translations: ["Стая"]
        ),
        .init(
            word: "Herd (of pigs)",
            transcription: "[hɜːd]",
            examples: [
                "A herd of pigs came squealing out of the greenery behind the savage and rushed away into the forest",
                "Here on the mountain grazing large herd of pigs"
            ],
            translations: ["Стадо"]
        ),
        .init(
            word: "Pack (of dogs)",
            transcription: "[pæk]",
            examples: [
                "A pack of wild dogs could've run right through the courtroom, and he might've kept it to himself",
                "Like, I'm sorry you have a pack of wild dogs going crazy in your neighborhood",
                "He was attacked by a pack of wild dogs he thought he saw"
            ],
            translations: ["Стая", "Свора"]
        ),
        .init(
            word: "School (of fish)",
            transcription: "[skuːl]",
            examples: [
                "An airplane passed overhead on its course to Miami and he watched its shadow scaring up the schools of flying fish",
                "There's a huge school of fish under the dock",
                "I think it's a school of small fish",
            ],
            translations: ["Стая", "Косяк"]
        ),
        .init(
            word: "Pride (of lions)",
            transcription: "[praɪd]",
            examples: [
                "To keep your body absolutely still during the putting stroke, imagine you're trying not to be noticed by a pride of lions",
                "For one pride of lions, this poses a major problem",
                "A pride of lions and a parliament of owls"
            ],
            translations: ["Прайд", "Стая"]
        ),
        .init(
            word: "Nest (of snakes)",
            transcription: "[nɛst]",
            examples: [
                "Outside the window, hiding the view, there was a \"zirando\", a tree with light branches that intertwined like a nest of snakes",
                "We were riding, we came upon a nest of snakes",
                "Your family is a nest of snakes",
            ],
            translations: ["Гнездо"]
        ),
        .init(
            word: "Litter (of puppies)",
            transcription: "[ˈlɪtə]",
            examples: [
                "Exactly six days after my son departed, his pet dog gave birth to a litter of five puppies",
                "You are breeding a litter of puppies"
            ],
            translations: ["Выводок", "Приплод", "Помет"]
        ),
        .init(
            word: "Growl",
            transcription: "[graʊl]",
            examples: [
                "Paying no attention to Kashtanka's growls, the sow lifted up her little hoof and grunted good-humouredly",
                "He tried to growl threateningly, ferociously",
                "Now give me the growl that means \"okay\"",
            ],
            translations: ["Реветь", "Рычать", "Рык"]
        ),
        .init(
            word: "Fly",
            transcription: "[flaɪ]",
            examples: [],
            translations: ["Муха", "Мушка"]
        ),
        .init(
            word: "Bee",
            transcription: "[biː]",
            examples: [
                "Practical Handbook of Bee Culture with Some Observations Upon the Segregation of the Queen",
                "To make a bee understand that it is the earth that travels around the sun",
                "Penicillin, bee stings, peanuts"
            ],
            translations: ["Пчела", "Трутень"]
        ),
        .init(
            word: "Spider",
            transcription: "[ˈspaɪdə]",
            examples: [
                "Crookshanks leapt lightly onto her lap. A large, dead spider was dangling from his mouth",
                "Six spider webs on the cornice, Miss Marple noted",
                "It's just spider web on a stick"
            ],
            translations: ["Паук", "Паутина"]
        ),
        .init(
            word: "Scorpion",
            transcription: "[ˈskɔːpɪən]",
            examples: [
                "To abruptly find such a secret in the midst of one's happiness resembles the discovery of a scorpion in a nest of turtledoves",
                "And the claws of a lobster resemble those of a large scorpion",
                "The Scorpion and the Toad"
            ],
            translations: ["Скорпион"]
        ),
        .init(
            word: "Cobra",
            transcription: "[ˈkɒbrə]",
            examples: [
                "The ladies were hissing like a nest of cobra's to quiet the shrieking creature",
                "Let's see if this cobra solves it",
                "Stephen Fry's barking cobra"
            ],
            translations: ["Кобра"]
        ),
        .init(
            word: "Dove",
            transcription: "[dʌv]",
            examples: [
                "I wasn't going to dive into it; I would have enough to do to keep my head above the surface",
                "A Turtle dove goes uptown dressed like a housemaid",
                "Not a goat but a regular dove",
            ],
            translations: ["Голубь", "Горлица"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .animals, typeTranslation: .enToRu)
    return bagOfGold
}
