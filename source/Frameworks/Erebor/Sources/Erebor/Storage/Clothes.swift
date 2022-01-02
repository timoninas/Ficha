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
            transcription: "",
            examples: [],
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
            transcription: "",
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
            transcription: "",
            examples: [],
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
            examples: [],
            translations: ["Бронежилет"]
        ),
        .init(
            word: "Life jacket",
            transcription: "",
            examples: [],
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
            examples: ["Angela fetched her needle book and mended her skirt without any more fuss",
                       "We skirt a small wood and then have the front-line immediately before us",
                       "He skirted it, following the woods, and came to the road and looked in both directions"],
            translations: ["Мини-юбка"]
        ),
        .init(
            word: "Knee-length skirt",
            transcription: "",
            examples: [],
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
            examples: ["We understand Han has a weakness for pleated white skirts and over-developed thighs",
                       "It's a regular short pleated skirt with stripes on it",
                       "I hate pleated skirts"],
            translations: ["Плиссированная юбка"]
        ),
        .init(
            word: "Wrap-around skirt",
            transcription: "",
            examples: [],
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
            transcription: "",
            examples: [],
            translations: ["Вечернее платье"]
        ),
        .init(
            word: "Fancy dress",
            transcription: "",
            examples: [],
            translations: ["Маскарадный костюм"]
        ),
        .init(
            word: "Backless dress",
            transcription: "",
            examples: [],
            translations: ["Платье с вырезом на спине"]
        ),
        .init(
            word: "Beaded dress",
            transcription: "",
            examples: [],
            translations: ["Платье, украшенное бисером"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .clothes, typeTranslation: .enToRu)
    return bagOfGold
}
