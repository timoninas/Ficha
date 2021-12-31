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
            examples: [],
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
            examples: [],
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
            transcription: "",
            examples: [],
            translations: ["Актерский состав"]
        ),
        .init(
            word: "Character",
            transcription: "",
            examples: [],
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
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .serials, typeTranslation: .enToRu)
    return bagOfGold
}
