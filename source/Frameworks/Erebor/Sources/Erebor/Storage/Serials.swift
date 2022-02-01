//
//  Serials.swift
//  
//
//  Created by Антон Тимонин on 23.12.2021.
//

import Foundation

func getGoldSerials() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Action!",
            transcription: "",
            examples: [
                "He watched as she left. The minute she was gone, George went into action",
                "He did not see the time was not ripe for vigorous action",
                "Miss Marple's action appeared to her natural and inevitable"
            ],
            translations: ["Мотор!"]
        ),
        .init(
            word: "Action movie",
            transcription: "",
            examples: [],
            translations: ["Боевик"]
        ),
        .init(
            word: "Actor",
            transcription: "[ˈæktə]",
            examples: [
                "It was once purchased by a stage actor for his movie star wife and is valued at ten million dollars",
                "There's three nations, several non-governmental actors currently vying for...",
                "Uh, you're running a sting and your lead actor jumps off a building, I'd call that bad"
            ],
            translations: ["Актер"]
        ),
        .init(
            word: "Actress",
            transcription: "",
            examples: [
                "He had brought with him Miss Constance Hathaway, an actress then playing in the popular success, Sentiment",
                "Do you think I'm an actress?",
                "- I want to be an actress"
            ],
            translations: ["Актриса"]
        ),
        .init(
            word: "Adventure film",
            transcription: "",
            examples: [],
            translations: ["Приключенческий фильм"]
        ),
        .init(
            word: "Alias",
            transcription: "[ˈeɪlɪəs]",
            examples: [
                "You own the name and renounce the alias?",
                "Well, Dan the dentist also knew him, and Jordan Chase is an alias",
                "I'm on that list, and eventually the alias I used will lead them back to me"
            ],
            translations: ["Вымышленное имя"]
        ),
        .init(
            word: "Animator",
            transcription: "",
            examples: [
                "Supervising Animator Masashi Ando",
                "Sometimes to save money... our animators will reuse the same backgrounds over and over and over again",
                "Key animator, Hiroshi Kitakubo, age 28",
            ],
            translations: ["Аниматор"]
        ),
        .init(
            word: "Aspect ratio",
            transcription: "",
            examples: [],
            translations: ["Соотношение сторон", "Формат"]
        ),
        .init(
            word: "Backstage",
            transcription: "",
            examples: [
                "I went with Cecil down to the front of the auditorium, through a door on one side, and backstage",
                "Uh... he included his, uh... backstage rider",
                "Next time you're in New York, maybe I can have my mom arrange for a backstage visit",
            ],
            translations: ["За кулисами"]
        ),
        .init(
            word: "Behind the scenes",
            transcription: "",
            examples: [],
            translations: ["За кулисами"]
        ),
        .init(
            word: "Black-and-white film",
            transcription: "",
            examples: [
                
            ],
            translations: ["Черно-белый фильм"]
        ),
        .init(
            word: "Box office",
            transcription: "",
            examples: [
                "And they don't care how you get it so long as it adds up at the box office",
                "- It's in the big box in my office",
                "Can't you see that's the box office?"
            ],
            translations: ["Касса"]
        ),
        .init(
            word: "Cameraman",
            transcription: "",
            examples: [],
            translations: ["Оператор"]
        ),
        .init(
            word: "Caption",
            transcription: "",
            examples: [
                "The caption under the drawing announced that the construction of the project was to begin at once",
                "Benefiting from his lessons aboard the Scriabin, the Grossmeister artistically drew four knights and the appropriate caption on a sheet of cardboard",
                "Not once have I used the real captions to Family Circus"
            ],
            translations: ["Титр"]
        ),
        .init(
            word: "Cartoon",
            transcription: "",
            examples: [],
            translations: ["Мультфильм"]
        ),
        .init(
            word: "Cast",
            transcription: " [kɑːst]",
            examples: [
                "Ahead of him, beside the road, a scrawny, dusty willow tree cast a speckled shade",
                "The street light on the corner cast sharp shadows on the Radley house",
                "The mere implication of foul play will cast a heavy shadow on the White House and NASA"
            ],
            translations: ["Актерский состав"]
        ),
        .init(
            word: "Character",
            transcription: "[ˈkærɪktə]",
            examples: [
                "The character of the light changed suddenly",
                "I know it's an Asian character, but nobody seems to recognize it",
                "Only the envoy of the Bishop bears this character"
            ],
            translations: ["Персонаж"]
        ),
        .init(
            word: "Cinema",
            transcription: "",
            examples: [],
            translations: ["Кино"]
        ),
        .init(
            word: "Movie theater",
            transcription: "",
            examples: [
                "In the year after Monadnock Valley Roark built two private homes in Connecticut, a movie theater in Chicago, a hotel in Philadelphia",
                "This isn't about the movie theater",
                "I kicked open a closet that turned out to be a private movie theater"
            ],
            translations: ["Театр"]
        ),
        .init(
            word: "Clapper",
            transcription: "",
            examples: [
                "The long beam continued to belabor the door, at regular intervals, like the clapper of a bell, the stones to rain down, the door to groan",
                "I've got four grams on me and one gram in me, which is why me heart is going like the clappers, as if I'm about to have a heart attack",
                "like the clappers"
            ],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Clapboard",
            transcription: "",
            examples: [
                "Making notations on a clipboard, the woman stalked back and forth like a disgusted drillmaster",
                "You can just give me that clipboard, because I should be the one asking you to donate money to me",
                "I don't have any more clipboards, so get one from the other fellas"
            ],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Clapperboard",
            transcription: "",
            examples: [],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Slate",
            transcription: "",
            examples: [
                "So if you agree, you'll be the only woman slated, and thus, a shoo-in",
                "Then the new slate roof of Aunt Pitty's house came in view with its red-brick walls, and Scarlett's heart throbbed",
                "That slate face cracked pink, ran a tongue the color of strawberry ice cream over the lips"
            ],
            translations: ["Хлопушка"]
        ),
        .init(
            word: "Close-up",
            transcription: "",
            examples: [
                "Send newcomers to fix the fence, it is necessary to close up a gap before the wind rises",
                "No one's been able to look at a sphere close up",
                "In my childhood I saw poverty and labor close up"
            ],
            translations: ["Крупный план"]
        ),
        .init(
            word: "Colour film",
            transcription: "",
            examples: [],
            translations: ["Цветной фильм"]
        ),
        .init(
            word: "Comedy",
            transcription: "",
            examples: [
                "Though you would have thought, with her brilliance, her roguishness, her sense of comedy she would have been perfect",
                "Well sometimes in comedy you have to generalize",
                "Now that's a clear cut situation with a promise of comedy"
            ],
            translations: ["Комедия"]
        ),
        .init(
            word: "Costume designer",
            transcription: "",
            examples: [],
            translations: ["Дизайнер по костюмам"]
        ),
        .init(
            word: "Crew",
            transcription: "",
            examples: [
                "You know, a thousand dollars ain't such a bad price for a medium bomber and a crew",
                "My crew would roll out the red carpet for you",
                "If you're part of a crew nobody ever tells you they're going to kill you"
            ],
            translations: ["Съемочная группа"]
        ),
        .init(
            word: "Crime film",
            transcription: "",
            examples: [],
            translations: ["Детектив"]
        ),
        .init(
            word: "Hobbit",
            transcription: " [ˈhɒbɪt]",
            examples: [],
            translations: ["Хоббит"]
        ),
        .init(
            word: "Director",
            transcription: "[dɪˈrektə]",
            examples: ["The agent frowned. \"It's the director of our Cryptology Department\"",
                       "Gabrielle scanned the crowd, but did not see anyone who looked like PODS mission director Chris Harper",
                       "Assistant art director on \"Rage\""],
            translations: ["Режиссер"]
        ),
        .init(
            word: "Drama",
            transcription: "[ˈdrɑːmə]",
            examples: ["From the cockpit of the idling Kiowa, Delta-One watched the drama unfold before him",
                       "Now Mrs. Hubbard, let me say, played the most important part in the drama",
                       "I was aware that Mr. Wopsle had not succeeded in reviving the Drama, but, on the contrary, had rather partaken of its decline"],
            translations: ["Драма"]
        ),
        .init(
            word: "Drive-in-theatre",
            transcription: "",
            examples: [
                "By 1994, we'll have drive- in theaters on Neptune!",
                "- It's a drive- in movie theatre",
                "Kind of like a drive- in movie theater, only without the cars"
            ],
            translations: ["Кинотеатр, куда можно въехать на автомобиле"]
        ),
        .init(
            word: "Dubbed film",
            transcription: "",
            examples: [
                "We a have a whole movie to dub in 4 days, and you came with your son",
                "Their modus operandi matches that of a highly successful team of thieves that the Interpol has dubbed \"The Hole In The Wall\" gang for obvious reasons",
                "Let's dub this one \"kaputnik\"",
            ],
            translations: ["Дублированый фильм"]
        ),
        .init(
            word: "Dubbed in Russian",
            transcription: "",
            examples: [],
            translations: ["Дублированый на русский язык"]
        ),
        .init(
            word: "Educational film",
            transcription: "",
            examples: [],
            translations: ["Общеобразовательный фильм"]
        ),
        .init(
            word: "Episode",
            transcription: "[ˈepɪsəʊd]",
            examples: [
                "But nothing and no one reminded her of the episode of the monkey",
                "Every episode of his life was resurrected to serve as foundations for malicious fabrications",
                "Or was the whole fantastic episode merely the figment of a diseased imagination, his own, of a deteriorating mind, a rotting brain?"
            ],
            translations: ["Эпизод", "Серия"]
        ),
        .init(
            word: "Fade out",
            transcription: "[feɪd aʊt]",
            examples: [
                "So I slept, hoping the sounds of the passing eras would fade out and a sort of death might happen",
                "Gradually the wrath faded out of the old King's face, and he said",
                "If she were happy with Lennox, I'd sit right back and fade out of the picture"
            ],
            translations: ["Исчезать постепенно"]
        ),
        .init(
            word: "Feature film",
            transcription: "[ˈfiːʧə fɪlm]",
            examples: [
                "This was supposed to be a regular feature film, but since we didn't have the money we had to use a much simpler technique",
                "What he presents in his feature film is fiction, a fictitious underground world",
                "I am pleased to present tonight's feature film, Eraserhead"
            ],
            translations: ["Художественный фильм", "Полнометражный фильм", "Игровое кино"]
        ),
        .init(
            word: "Film",
            transcription: "[fɪlm]",
            examples: [
                "I thought that all special training these days was done by film. Mrs. Phelps blinked. \"You reading up on fireman theory?\"",
                "It's the material they use to make motion film",
                "It's like on a film loop in my brain",
            ],
            translations: ["Фильм", "Плёнка"]
        ),
        .init(
            word: "Flash-back",
            transcription: "",
            examples: [],
            translations: ["Воспоминания героя", "Возврат в прошлое"]
        ),
        .init(
            word: "Full-length film",
            transcription: "",
            examples: [],
            translations: ["Полнометражный фильм"]
        ),
        .init(
            word: "Happy ending",
            transcription: "[ˈhæpɪ ˈendɪŋ]",
            examples: [
                "I'm sorry your plus one doesn't get a happy ending, but, like it or not, I just saved this world because I want to change",
                "It's going to be all right, Tracy told herself. This movie's going to have a happy ending",
                "Did someone order a happy ending?"
            ],
            translations: ["Счастливый конец"]
        ),
        .init(
            word: "Historical film",
            transcription: "[hɪsˈtɒrɪkəl fɪlm]",
            examples: [
                "Sophie glanced at Langdon, who nodded. Sophie, the historical evidence supporting this is substantial",
                "The thoughts of historical spirits suddenly made Rachel realize what a sacred place this room was",
                "Cooper sat in his darkened room hour after hour, looking at the film, and the first glimmering of suspicion became a certainty"
            ],
            translations: ["Исторический фильм"]
        ),
        .init(
            word: "Horror film",
            transcription: "[ˈhɒrə fɪlm]",
            examples: [
                "I still can't believe they needed multiple oboes for a small horror film",
                "Place looks like the start of an amish horror film",
                "- It's some sort of horror film- something she shouldn't be looking at anyway"
            ],
            translations: ["Фильм ужасов"]
        ),
        .init(
            word: "Location",
            transcription: "[ləʊˈkeɪʃn]",
            examples: [
                "I can tell that by the conformation of your brain and the strange location of your internal organs and the shape and size of your heart",
                "You got a specific location for this place or are we just gonna wander around till we find it?",
                "Teabing gasped. Then the location of the keystone would be lost forever!"
            ],
            translations: ["Место натурных съемок"]
        ),
        .init(
            word: "Long shot",
            transcription: "[lɒŋ ʃɒt]",
            examples: [
                "It's a long shot, but I got to try, gotta get down there and reconstruct the shot",
                "It's a long shot, but, worth a try especially given the alternative",
                "I know my new plan is a long shot, but it's the only hope left"
            ],
            translations: ["Общий план"]
        ),
        .init(
            word: "Makeup",
            transcription: "[ˈmeɪkʌp]",
            examples: [
                "Presumably it's the same place as the glove, which, judging from its atomic makeup, isn't anywhere local",
                "Tracy became a chameleon, an expert in makeup and disguises and accents. She acquired half a dozen passports",
                "Deb, the makeup artist, will take care of you from here"
            ],
            translations: ["Грим", "Состав"]
        ),
        .init(
            word: "Makeup artist",
            transcription: "[ˈmeɪkʌp ˈɑːtɪst]",
            examples: [
                "So I get here, and Grandma immediately whisks me upstairs where her hairdresser and makeup artist are waiting to make a new me",
                "I just paid a makeup artist 500 bucks to do my face",
                "A mortician's nothing more than a glorified makeup artist",
            ],
            translations: ["Художник по гриму", "Гример"]
        ),
        .init(
            word: "Movie",
            transcription: "[ˈmuːvɪ]",
            examples: [
                "If we get one big movie, we can get all the big movies",
                "If you take her to a lousy movie, for instance, she knows it's a lousy movie",
                "I was meeting my little boy, not this handsome movie star"
            ],
            translations: ["Кинофильм", "Кинокартина"]
        ),
        .init(
            word: "Musical",
            transcription: "[ˈmjuːzɪkəl]",
            examples: [
                "He has a remarkable musical talent, and he wants to be a classical musician. He's going to choose his own life",
                "Her voice took me by surprise; it didn't match her face at all; it was musical and slightly tremulous",
                "She would never forget the leap of her heart as she heard it, as if for the first time, drawling, resonant, musical"
            ],
            translations: ["Мюзикл"]
        ),
        .init(
            word: "Mute film",
            transcription: "",
            examples: [
                "I just feel like I'm being pulled back into this version of me when I was, like, 12 and furious and invisible and mute",
                "His eye fell with a mute inquiry upon the withered white flowers upon the little table",
                "This is the talkback button here, if I want to talk to Roz, the cough button if I want to mute the mike"
            ],
            translations: ["Немой фильм"]
        ),
        .init(
            word: "Newsreel",
            transcription: "[ˈnjuːzriːl]",
            examples: [
                "The newsreel was on or something, and all of a sudden I felt this hand on the back of my neck, and it was Jane's",
                "David saw to it that a special print of the newsreel of the wedding was sent on to Cord, who was in Europe at the time",
                "There was a glimpse of her on some newsreel footage after the bomb blast",
            ],
            translations: ["Кинотрейлер", "Киножурнал", "Кинохроника"]
        ),
        .init(
            word: "Offscreen narration",
            transcription: "",
            examples: [
                "Indeed, when, at certain moments, I perceived that my more ardent passages confused him, I purposely increased my ardour of narration",
                "You know full well that the narration in this novel is impersonal but also incomplete",
                "Our music is more of a narration of an oppressed people"
            ],
            translations: ["Повествование за кадром"]
        ),
        .init(
            word: "Open-air theatre",
            transcription: "",
            examples: [
                "Nadine found Lennox sitting at the top of the Graeco-Roman Theatre",
                "One thing we can agree on, this delicate, little theater between us does need to reach a conclusion, so...",
                "They stand inside the bed, and we sprawl back in them as in a theatre box"
            ],
            translations: ["Кинотеатр под открытым небом"]
        ),
        .init(
            word: "Original soundtrack (OST)",
            transcription: "[əˈrɪʤɪn(ə)l ˈsaʊndtræk]",
            examples: [
                "I always feel as if I were reading to you a carbon copy of myself and you've already seen the original",
                "He's just got this very original personality that takes you a little while to get to know him",
                "A cast of your skull, sir, until the original is available, would be an ornament to any anthropological museum"
            ],
            translations: ["Оригинальный саундтрек"]
        ),
        .init(
            word: "Plot",
            transcription: "[plɒt]",
            examples: [
                "Let us suppose that these bad terms were part of a clever plot",
                "That it was I and I alone who had the idea for the great and daring mouse plot",
                "A fraternal lodge to which he had belonged gave her a cemetery plot"
            ],
            translations: ["Сюжет", "Интрига", "Фабула"]
        ),.init(
            word: "Poster",
            transcription: "",
            examples: [
                "The Banner assumed the appearance of a circus poster in body, of a circus performance in soul",
                "Whenever your family comes into your life, I instantly become the poster boy for the Rebecca Logan",
                "I'm looking for a poster board and markers"
            ],
            translations: ["Афиша", "Плакат"]
        ),
        .init(
            word: "Producer",
            transcription: "[prəˈdjuːsə]",
            examples: [
                "Giving up control of your message putting that in the hands of news producers",
                "The whole industry knows you maneuvered Cord into buying the company so you could become a producer",
                "The maintenance of court etiquette was in the hands of a Russian emigre, a famous ballet producer"
            ],
            translations: ["Продюсер"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .serials, typeTranslation: .enToRu)
    return bagOfGold
}
