//
//  Clothes.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldClothes() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Shirt",
            transcription: "[ʃɜːt]",
            examples: ["Ripping off his shirt, he hurled it to his right onto the open deck",
                       "\"I do. Jamie looked at the hopeful young boy with the stained shirt. The next shovelful of dirt\""],
            translations: ["Рубашка"]
        ),
        .init(
            word: "T-shirt",
            transcription: "",
            examples: [
                "I brought a T shirt",
                "Like the T- shirt?",
                "Put your T- shirt on"
            ],
            translations: ["Футболка"]
        ),
        .init(
            word: "Polo shirt",
            transcription: "[ˈpəʊləʊ ʃɜːt]",
            examples: [
                "Come on, you are gonna look so sweet in a polo shirt and a pair of chinos",
                "He only fits into American polo shirts",
                "When Dad was around, she wore polo shirts and cooked meat"
            ],
            translations: ["Рубашка поло"]
        ),
        .init(
            word: "Fitted shirt",
            transcription: "",
            examples: ["I can't believe I even fit into this shirt",
                       "Medium build, fitted crimson T- shirt",
                       "Is that a slim- fit Armani shirt?"],
            translations: ["Приталенная рубашка"]
        ),
        .init(
            word: "Loose-fitting shirt",
            transcription: "",
            examples: [],
            translations: ["Рубашка свободного покроя"]
        ),
        .init(
            word: "Cuff",
            transcription: "[kʌf]",
            examples: ["Angry at his own carelessness, he tore the cuff from his pant leg and rammed the fabric into the toe of his boot",
                       "Maybe you should cuff him",
                       "Climbing back down Gabrielle picked up the cuff links and put them back on the sink"],
            translations: ["Манжета"]
        ),
        .init(
            word: "Button",
            transcription: "[bʌtn]",
            examples: ["He clicked the \"search\" button",
                       "Why don't you, uh, find a button on one of those keyboards and lay down some kind of beat?",
                       "Because I put a little release button right here on top"],
            translations: ["Пуговица"]
        ),
        .init(
            word: "Pocket",
            transcription: "[ˈpɒkɪt]",
            examples: ["Langdon pulled the heavy key from his pocket again",
                       "She had put her louis in the pocket of her new apron",
                       "He saw the cigarette-holder between his fingers and put it back into his pocket"],
            translations: ["Карман"]
        ),
        .init(
            word: "Breast pocket",
            transcription: "[brest ˈpɒkɪt]",
            examples: [],
            translations: ["Нагрудный карман"]
        ),
        .init(
            word: "Blouse",
            transcription: "[blaʊz]",
            examples: ["The woman was attractive, in her mid-thirties, wearing gray, pleated flannel pants, conservative flats, and an ivory Laura Ashley blouse",
                       "He did not wear the gondolier's blouse: only the knitted blue jersey",
                       "No one in the world has such an elegant blouse as this"],
            translations: ["Блузка"]
        ),
        .init(
            word: "Tunic",
            transcription: "[ˈtjuːnɪk]",
            examples: [],
            translations: ["Туника"]
        ),
        .init(
            word: "Turtleneck",
            transcription: "",
            examples: ["Seldon studied the sleeve of his new tunic",
                       "The commissioner of police unbuttoned his tunic again and looked at Yossarian with contempt",
                       "He stared at the tall young man in uniform-the Spaceship-and-Sun neatly placed on the left side of his tunic"],
            translations: ["Водолазка"]
        ),
        .init(
            word: "Jacket",
            transcription: "",
            examples: [],
            translations: ["Куртка", "Жакет"]
        ),
        .init(
            word: "Casual jacket",
            transcription: "[ˈʤækɪt]",
            examples: ["She tried not to run, afraid of attracting attention. She pulled her jacket close around her to conceal her ripped blouse",
                       "Next to the jacket, emergency water, nail clippers, tooth brush, space blanket..."],
            translations: ["Повседневная куртка"]
        ),
        .init(
            word: "Leather jacket",
            transcription: " [ˈleðə ˈʤækɪt]",
            examples: [
                "She studied Nevada for a moment, her eyes taking in his worn leather jacket, the faded Levi's, the wide-brimmed cowboy hat",
                "Kilgrave wanted a leather jacket, live cello music, and the flattering smile of a pretty girl",
                "So, 96 bucks for your leather jacket"
            ],
            translations: ["Кожаная куртка"]
        ),
        .init(
            word: "Dinner jacket",
            transcription: "",
            examples: [
                "He rose and ran on, in his stained dinner jacket, his burst collar and broken hair",
                "- Have you brought a dinner jacket?",
                "There's Ryan Trilling in the white dinner jacket",
            ],
            translations: ["Смокинг"]
        ),
        .init(
            word: "Hooded jacket",
            transcription: "",
            examples: [],
            translations: ["Куртка с капюшоном"]
        ),
        .init(
            word: "Flak jacket",
            transcription: "",
            examples: [
                "I don't care if you wear a bikini, or overalls, or a flak jacket, really",
                "There is no flak jacket, no defensive-driving maneuver, no undercover persona that can protect you when using human intelligence",
                "Lab just found some tiny traces of blood on her flak jacket, on the collar"
            ],
            translations: ["Бронежилет"]
        ),
        .init(
            word: "Life jacket",
            transcription: "",
            examples: [
                "You need a goddamn life jacket no matter how fast you paddle",
                "Do you know if he was wearing a life jacket?",
                "I was so turned on, we were gonna need a canoe and life jackets"
            ],
            translations: ["Спасательный жилет"]
        ),
        .init(
            word: "Skirt",
            transcription: "[skɜːt]",
            examples: [
                "As her skirt slid up, he eyed her legs appreciatively",
                "Angela fetched her needle book and mended her skirt without any more fuss",
                "She contented herself with plucking Jean Valjean by the skirt of his coat"
            ],
            translations: ["Юбка"]
        ),
        .init(
            word: "Miniskirt",
            transcription: "[skɜːt]",
            examples: [
                "Angela fetched her needle book and mended her skirt without any more fuss",
                "We skirt a small wood and then have the front-line immediately before us",
                "He skirted it, following the woods, and came to the road and looked in both directions"
            ],
            translations: ["Мини-юбка"]
        ),
        .init(
            word: "Knee-length skirt",
            transcription: "",
            examples: [
                "She was sitting on the floor brushing at her skirt, looking down at Sefelt",
                "I'm seeing pigtails, frilly skirt",
                "Poor little skirt"
            ],
            translations: ["Юбка до колена"]
        ),
        .init(
            word: "Calf-length skirt",
            transcription: "",
            examples: [
                "As her skirt slid up, he eyed her legs appreciatively",
                "Angela fetched her needle book and mended her skirt without any more fuss",
                "I picked up a torn skirt which she had left lying on the floor and took it down with me for her to mend after breakfast"
            ],
            translations: ["Юбка ниже колена"]
        ),
        .init(
            word: "Multi-colored skirt",
            transcription: "",
            examples: [],
            translations: ["Разноцветная юбка"]
        ),
        .init(
            word: "Pleated skirt",
            transcription: "[ˈpliːtɪd skɜːt]",
            examples: [
                "We understand Han has a weakness for pleated white skirts and over-developed thighs",
                "It's a regular short pleated skirt with stripes on it",
                "I hate pleated skirts"
            ],
            translations: ["Плиссированная юбка"]
        ),
        .init(
            word: "Wrap-around skirt",
            transcription: "",
            examples: [
                "As her skirt slid up, he eyed her legs appreciatively",
                "Angela fetched her needle book and mended her skirt without any more fuss",
                "I picked up a torn skirt which she had left lying on the floor and took it down with me for her to mend after breakfast"
            ],
            translations: ["Юбка с запахом"]
        ),
        .init(
            word: "Dress",
            transcription: "[dres]",
            examples: ["A thin black woman was seated in a chair in a corner of the room sewing on a dress",
                       "The little girl watched me, holding the bread against her dirty dress",
                       "He not only brought Maybelle the satin but he was able to give excellent hints on the making of the wedding dress"],
            translations: ["Платье"]
        ),
        .init(
            word: "Cocktail dress",
            transcription: "[ˈkɒkteɪl dres]",
            examples: [
                "Where is the red cocktail dress?",
                "I'll bust you out of there... just as soon as I get a cocktail dress and a crowbar",
                "Why haven't you picked up my cocktail dress for Chuck's party yet?"
            ],
            translations: ["Вечернее платье"]
        ),
        .init(
            word: "Fancy dress",
            transcription: " [ˈfænsɪ dres]  ",
            examples: [
                "Then I cleaned the make-up off my face that I had put on for the fancy dress",
                "Are you practising your appearance for the fancy dress ball?",
                "Hands up for the Manderley fancy dress ball"
            ],
            translations: ["Маскарадный костюм"]
        ),
        .init(
            word: "Backless dress",
            transcription: "",
            examples: [
                "A thin black woman was seated in a chair in a corner of the room sewing on a dress",
                "And this, despite her masculine dress, is Tribeswoman Venabili",
                "She never conformed in dress or conduct"
            ],
            translations: ["Платье с вырезом на спине"]
        ),
        .init(
            word: "Beaded dress",
            transcription: "",
            examples: [
                "She trotted down the hall, running her fingers through the beaded curtains",
                "He lowered it and drew his hunting-knife from its beaded sheath at his hip",
                "The little girl watched me, holding the bread against her dirty dress"
            ],
            translations: ["Платье, украшенное бисером"]
        ),
        .init(
            word: "Low-cut dress",
            transcription: "",
            examples: [
                "Like he wouldn't do the same thing if Elaine walked by in a low- cut dress",
                "Now all you need is a low- cut dress cinched at the waist, and you'll be all set",
                "Oh, and Paralegally Blonde isn't here in her low- cut dress to make me jealous?"
            ],
            translations: ["Платье с глубоким вырезом"]
        ),
        .init(
            word: "Flowery dress",
            transcription: "",
            examples: [
                "I'm in a flowery dress, my hair's shoulder-length",
                "In my flowery dress I ask him to quiz me after school",
                "She was wearing a flowery dress"
            ],
            translations: ["Платье с цветным принятом"]
        ),
        .init(
            word: "Glittery dress",
            transcription: "",
            examples: [
                "A thin black woman was seated in a chair in a corner of the room sewing on a dress",
                "And this, despite her masculine dress, is Tribeswoman Venabili",
                "She never conformed in dress or conduct"
            ],
            translations: ["Блестящее платье"]
        ),
        .init(
            word: "Sleeveless dress",
            transcription: "",
            examples: [
                "\"They turned me out of one place today because I had on a sleeveless dress,\" she said ruefully",
                "They turned me out because I have on a sleeveless dress",
                "I mean, my political window just slams shut the second I can't wear sleeveless dresses"
            ],
            translations: ["Платье без рукавов"]
        ),
        .init(
            word: "V-necked dress",
            transcription: "",
            examples: [
                "A thin black woman was seated in a chair in a corner of the room sewing on a dress",
                "And this, despite her masculine dress, is Tribeswoman Venabili",
                "She never conformed in dress or conduct"
            ],
            translations: ["Платье c V-образным вырезом"]
        ),
        .init(
            word: "Round-necked dress",
            transcription: "",
            examples: [
                "It reconstructs the purple from the rag, and the woman from the scrap of her dress",
                "One must be very rich to dress as badly as you do",
                "He reached across the table to take Justine's hand; she was looking, he thought, more beautiful with maturity, in spite of that ghastly dress"
            ],
            translations: ["Платье с круглым вырезом"]
        ),
        .init(
            word: "Evening gown",
            transcription: "[ˈiːvnɪŋ gaʊn]",
            examples: [
                "\"Come in, Frank!\" called Aileen. \"I'm just trying on an evening gown\"",
                "Bring Darius to the mansion right now and I will ditch the evening gowns",
                "Her complexion was glowing, and her bare arms and shoulders shone white against the dark red of her evening gown"
            ],
            translations: ["Вечернее (бальное) платье"]
        ),
        .init(
            word: "Business suit",
            transcription: "[ˈbɪznəs suːt]",
            examples: [
                "Maybe it was the way she wore her hair. Or the simple business suit",
                "A brown-faced man dressed in a light gray business suit got out and walked across to the truck",
                "A man in a 20th-century business suit"
            ],
            translations: ["Деловой костюм"]
        ),
        .init(
            word: "Pants suit",
            transcription: "[pænts suːt]",
            examples: [
                "And then Lang called and he said you left your pant suit at the headquarters",
                "Like in the movies with the headsets and the black pant suits?",
                "What's with the pant suit, mami?"
            ],
            translations: ["Женский брючный костюм"]
        ),
        .init(
            word: "Uniform",
            transcription: "[ˈjuːnɪfɔːm]",
            examples: [
                "I looked mighty vip too, in black and gold uniform which Stu claimed was Lunar diplomatic uniform of my rank",
                "There were so many strident faceless people in uniform in the dining room with him",
                "Fritz answered the door, not clad in his smart navy chauffeur's uniform, clad in his smart butler's morning suit instead"
            ],
            translations: ["Форма (рабочая)"]
        ),
        .init(
            word: "Button-through dress",
            transcription: "[ˈbʌtn̩ θruː dres]",
            examples: [
                "A thin black woman was seated in a chair in a corner of the room sewing on a dress",
                "The little girl watched me, holding the bread against her dirty dress",
                "He not only brought Maybelle the satin but he was able to give excellent hints on the making of the wedding dress"
            ],
            translations: ["Платье-халат"]
        ),
        .init(
            word: "Pinafore dress",
            transcription: "[ˈpɪnəfɔː dres]",
            examples: [
                "She was wearing a long white chiffon dress with delicate silver slippers and a diamond necklace, a present from Kate",
                "It reconstructs the purple from the rag, and the woman from the scrap of her dress",
                "I'm making a child's dress, for Mrs Flint's baby"
            ],
            translations: ["Сарафан"]
        ),
        .init(
            word: "House dress",
            transcription: "[ˈhaʊs dres]",
            examples: [
                "She wore a cotton house dress and red mules, on the insteps of which were little bouquets of red ostrich feathers",
                "Tracy,you're not going out the house dressed like that",
                "I managed to get him back to my house and dress his wounds"
            ],
            translations: ["Домашнее платье"]
        ),
        .init(
            word: "Maternity wear",
            transcription: "[məˈtɜːnɪti weə]",
            examples: [],
            translations: ["Одежда для беременных"]
        ),
        .init(
            word: "Maternity dress",
            transcription: "[məˈtɜːnɪti dres]",
            examples: [
                "Tracy wore a black wig, a maternity dress and padding, heavy makeup, and dark sunglasses",
                "I brought the maternity dress from home, and Tessie took charge of the accessories",
                "I hope your aunt doesn't think that's a maternity dress"
            ],
            translations: ["Платье для беременных"]
        ),
        .init(
            word: "Sweater",
            transcription: "[ˈswetə]",
            examples: [
                "Slowly, Sophie pulled the cruciform key from her sweater pocket and held it out to Teabing",
                "He saw that she was wearing a black sweater and a tight black skirt",
                "I always thought that was a sweater cubby"
            ],
            translations: ["Свитер"]
        ),
        .init(
            word: "Jersey",
            transcription: "[ˈdʒɜːzi]",
            examples: [
                "He was dressed in grey, grey stockings above the knee, grey shorts, and a grey jersey",
                "He was startled to see a letter for him from Jersey in a writing he knew too well, and had expected least to behold again",
                "I'm creating a Jersey dress"
            ],
            translations: ["Свитер", "Вязаная кофта"]
        ),
        .init(
            word: "Cardigan",
            transcription: "[ˈkɑːdɪɡən]",
            examples: [
                "You should have worn a different cardigan this morning, Christina",
                "Can you take your cardigan off and stand up, please?",
                "That's a very pretty cardigan you have on today, Dot"
            ],
            translations: ["Кардиган", "Кофта", "Жилет"]
        ),
        .init(
            word: "Jacket",
            transcription: "[ˈdʒækɪt]",
            examples: [
                "She tried not to run, afraid of attracting attention. She pulled her jacket close around her to conceal her ripped blouse",
                "Next to the jacket, emergency water, nail clippers, tooth brush, space blanket...",
                "Then a gloomy old woman came in and spent ages unwinding her scarf and taking off her jacket"
            ],
            translations: ["Куртка", "Пиджак"]
        ),
        .init(
            word: "Vest",
            transcription: "[vest]",
            examples: [
                "His Majesty intends to vest the succession with the children he will have with Queen Anne",
                "He is sincerely for the revolution and fully deserves the trust that the Yuriatin City Council has vested in him",
                "It will state that the line of succession is now firmly vested in our children... and no others"
            ],
            translations: ["Жилет", "Майка", "Бронежелет"]
        ),
        .init(
            word: "Blouse",
            transcription: "[blaʊz]",
            examples: [
                "The woman was attractive, in her mid-thirties, wearing gray, pleated flannel pants, conservative flats, and an ivory Laura Ashley blouse",
                "He did not wear the gondolier's blouse: only the knitted blue jersey",
                "No one in the world has such an elegant blouse as this"
            ],
            translations: ["Блузка", "Кофточка", "Гимнастерка"]
        ),
        .init(
            word: "Shirt",
            transcription: "[ʃɜːt]",
            examples: [
                "Ripping off his shirt, he hurled it to his right onto the open deck",
                "I do. Jamie looked at the hopeful young boy with the stained shirt. The next shovelful of dirt",
                "To put on a grey shirt once more was strangely pleasing"
            ],
            translations: ["Рубашка", "Сорочка"]
        ),
        .init(
            word: "Tunic",
            transcription: "[ˈtjuːnɪk]",
            examples: [
                "The commissioner of police unbuttoned his tunic again and looked at Yossarian with contempt",
                "I sat beside him, undid my tunic and tried to rip the tail of my shirt",
                "She simply removed her uniform tunic and started building"
            ],
            translations: ["Туника", "Блузка", "Жакет"]
        ),
        .init(
            word: "T-shirt",
            transcription: "[ˈtiː ʃɜːt]",
            examples: [
                "The lifeguard was standing on the edge of the pool; he had a whistle and a T- shirt on with his ward number on it",
                "T- shirt or top?",
                "Prince T- shirt?"
            ],
            translations: ["Футболка"]
        ),
        .init(
            word: "Tank top",
            transcription: "[tæŋk tɒp]",
            examples: [
                "I can just picture the two of us, tank tops and spandex",
                "A... one-eyed princess in a long, flowing... tank top",
                "I wore a tank top today because I thought it was summer"
            ],
            translations: ["Вязаный жилет", "Майка на лямках"]
        ),
        .init(
            word: "Halter top",
            transcription: "[ˈhɔːltə tɒp]",
            examples: [
                "You know, sometimes I drive past her house and she's out watering her lawn in her shorty shorts and her halter top",
                "And I already bought Tammy a halter top for her birthday",
                "Now I can't wear halter tops, you stupid zombie",
            ],
            translations: ["Короткий топ"]
        ),
        .init(
            word: "Sun hat",
            transcription: "",
            examples: [
                "Why hadn't she brought her sun hat?",
                "Then will you need an umbrella or a sun hat?",
                "- We've got sun hats."
            ],
            translations: ["Шляпа от солнца"]
        ),
        .init(
            word: "Wool hat",
            transcription: "",
            examples: [
                "He was wearing a black wool hat with the hood of his red jumper over the hat, and a black, sleeveless, quilted coat and brown chinos",
                "The girls could be wearing some wool gloves or wool hats, no cotton fibers?",
                "A bearded man in a wool hat drove them"
            ],
            translations: ["Шерстяная шляпа"]
        ),
        .init(
            word: "Scarf",
            transcription: "[skɑːf]",
            examples: [
                "In a hoop, with those funny puffy things-what the devil are they called?-that they wore to emphasize their hips, an apron and a scarf round me neck",
                "Left behind, on the floor of the cargo plane, was the scarf Jeff had given her",
                "Hey, pal, I've been meaning to tell you that scarf is so not your color"
            ],
            translations: ["Шарф", "Кашне", "Галстук"]
        ),
        .init(
            word: "Glasses",
            transcription: "[ˈɡlɑːsɪz]",
            examples: [
                "She produced with enormous pride a small pair of opera glasses",
                "The eyes that were staring into the glass unseeingly suddenly focused",
                "Piggy wiped his glass again"
            ],
            translations: ["Очки", "Бинокль"]
        ),
        .init(
            word: "Earrings",
            transcription: "[ˈɪərɪŋ]",
            examples: [
                "Look for his sparkling earrings",
                "And she has the other earring",
                "Where's the earring?"
            ],
            translations: ["Серьга", "Серёжка"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .clothes, typeTranslation: .enToRu)
    return bagOfGold
}
