//
//  Architecture.swift
//  
//
//  Created by Антон Тимонин on 21.12.2021.
//

import Foundation

func getGoldArhitecture() -> BagOfGoldWords {
    var ereborGoldWords: [EreborGoldWord] = []
    
    ereborGoldWords.append(contentsOf: [
        .init(
            word: "Apse",
            transcription: "[æps]",
            examples: [
                "I was taken up the apse",
                "Well, at the time, you know, it... it seemed like the apse"
            ],
            translations: ["Апсида", "Абсида"]
        ),
        .init(
            word: "Arched colonnade",
            transcription: "[ɑːtʃt ˌkɒləˈneɪd]",
            examples: [],
            translations: ["Арочная колоннада"]
        ),
        .init(
            word: "Renaissance architect",
            transcription: "[rɪˈneɪsns ˈɑːkɪtekt]",
            examples: ["In proportion as architecture ebbs, printing swells and grows"],
            translations: ["Архитектор эпохи Возрождения (Ренессанса)"]
        ),
        .init(
            word: "Architecture",
            transcription: "[ˈɑːkɪtektʃə]",
            examples: ["Architecture is dethroned",
                       "So... the architecture of Neolution is under our control"],
            translations: ["Архитектура", "Зодчество"]
        ),
        .init(
            word: "Architectural patronage",
            transcription: "[ˌɑːkɪˈtektʃrəl ˈpætrənɪdʒ]",
            examples: ["\"Do you know that I'm an architectural expert?\"",
                       "They want their basic architectural elements back"],
            translations: ["Архитектурный патронаж"]
        ),
        .init(
            word: "Asymmetric plan",
            transcription: "[ˌeɪsɪˈmetrɪk plæn]",
            examples: ["There are many benefits to be had from the plan"],
            translations: ["Ассиметричный план"]
        ),
        .init(
            word: "Baptistry",
            transcription: "[baptistry]",
            examples: [],
            translations: ["Баптистерий"]
        ),
        .init(
            word: "Pinnacle",
            transcription: "[ˈpɪnəkəl]",
            examples: [],
            translations: ["Башенка"]
        ),
        .init(
            word: "Veranda",
            transcription: "[vəˈrændə]",
            examples: ["Bob got up and went out onto the veranda",
                       "Anne leaned forward, hands on the veranda railing"],
            translations: ["Веранда", "Терраса"]
        ),
        .init(
            word: "Exterior",
            transcription: "[ɪkˈstɪərɪə]",
            examples: ["Interiors, exteriors, um, anything really",
                       "Just want to know... what is behind this strong, silent exterior?"],
            translations: ["Внешняя часть"]
        ),
        .init(
            word: "To erect",
            transcription: "[tu ɪˈrekt]",
            examples: ["I don't want to erect a tomb for him in my heart",
                       "When he decided to erect a building, he spent six months looking for an architect"],
            translations: ["Возводить", "Строить"]
        ),
        .init(
            word: "Exposition \nExhibition",
            transcription: "[ˌekspəˈzɪʃən]",
            examples: [],
            translations: ["Выставка"]
        ),
        .init(
            word: "Harmony of form and color",
            transcription: "[ˈhɑːməni əv ˈfɔːm ənd ˈkʌlər]",
            examples: ["They call it harmony"],
            translations: ["Гармония формы и цвета"]
        ),
        .init(
            word: "Clay for brick",
            transcription: "[kleɪ fə brɪk]",
            examples: ["The privatization of space had just struck a brick wall"],
            translations: ["Глина для кирпича"]
        ),
        .init(
            word: "Urban surroundings",
            transcription: "[ˈɜːbən səˈraʊndɪŋz]",
            examples: ["In these new surroundings, he is a surprisingly adept swimmer"],
            translations: ["Городские окрестности"]
        ),
        .init(
            word: "Urban core",
            transcription: "[ˈɜːbən kɔː]",
            examples: [
                "\"Anyhow, he gives large parties,\" said Jordan, changing the subject with an urban distaste for the concrete",
                "Above us lay the glow of the galaxy-the fierce blue-whiteness of the central core, with the filmy mistiness of the arms spiraling out from it",
                "That's an urban legend"
            ],
            translations: ["Городской центр", "Городское ядро"]
        ),
        .init(
            word: "Woodcut",
            transcription: "[ˈwʊdkʌt]",
            examples: ["It's crude, but remarkably similar to these copies... of old woodcuts and medieval drawings"],
            translations: ["Гравюра на дереве", "Ксилография"]
        ),
        .init(
            word: "Greek temples",
            transcription: "[ɡriːk ˈtempəlz]",
            examples: ["The west wall of Solomon's Temple"],
            translations: ["Греческие храмы"]
        ),
        .init(
            word: "Designer",
            transcription: "[dɪˈzaɪnə]",
            examples: ["He walked to the apartment of Neil Dumont, his new designer and best friend",
                       "- Video game designer",
                       "I send you out for exciting new designer drugs, and you come back with tomato sauce."],
            translations: ["Дизайнер", "Проектировщик", "Художник"]
        ),
        .init(
            word: "Ancient construction",
            transcription: "[ˈeɪnʃənt kənˈstrʌkʃən]",
            examples: ["Paris's ancient Rose Line",
                       "But after construction began, the station's budget spiraled wildly out of control, and many countries dropped out in disgust"],
            translations: ["Древняя конструкция"]
        ),
        .init(
            word: "Picturesque architecture",
            transcription: "[ˌpɪktʃəˈresk ˈɑːkɪtektʃə]",
            examples: ["They visited Volendam, the old picturesque fishing village on the Zuider Zee, and Madurodam, Holland in miniature",
                       "Architecture is dethroned"],
            translations: ["Живописная архитектура"]
        ),
        .init(
            word: "Lime",
            transcription: "[laɪm]",
            examples: ["Then who was that in Lime House last night?",
                       "Her body is in the lime pit"],
            translations: ["Известь"]
        ),
        .init(
            word: "Interior spaces",
            transcription: "[ɪnˈtɪərɪə ˈspeɪsɪz]",
            examples: [],
            translations: ["Интерьер помещений"]
        ),
        .init(
            word: "Spanish Baroque",
            transcription: "[ˈspænɪʃ bəˈrɒk]",
            examples: ["Put that baroque masterpiece down!",
                       "We'll start with a bit of typical Baroque trumpet music",
                       "Is that medieval, is that baroque or gothic?"],
            translations: ["Испанское барокко"]
        ),
        .init(
            word: "Compositional",
            transcription: "[ˌkɑːmpəˈzɪʃənəl]",
            examples: ["Let me try a compositional analysis",
                       "The genius of the 12-tone compositional system should not be underestimated"],
            translations: ["Композиционный"]
        ),
        .init(
            word: "Landscape architect",
            transcription: "[ˈlændskeɪp ˈɑːkɪtekt]",
            examples: ["If you have a problem with the plants, I can call my landscape architect",
                       "And she is marrying the landscape architect",
                       "I was a landscape architect"],
            translations: ["Ландшафтный архитектор"]
        ),
        .init(
            word: "Red-tiled roof",
            transcription: "[ruːf]",
            examples: ["She glanced up impatiently at the veranda roof, as if tired of shouting",
                       "What did the ballot matter when bread, a roof and staying out of jail were the real problems?",
                       "Alone now, he knelt on the roof, and prayed"],
            translations: ["Красная черепичная крыша"]
        ),
        .init(
            word: "Medieval oversized chimney",
            transcription: "[ˌmedɪˈiːvəl ˈəʊvəsaɪzd ˈtʃɪmni]",
            examples: ["But I'm not, like, some oversized behemoth",
                       "His flaws were correspondingly oversized",
                       "It came howling down the chimney in our room!"],
            translations: ["Крупногабаритный средневековый дымоход"]
        ),
        .init(
            word: "Forge",
            transcription: "[fɔːdʒ]",
            examples: ["When I left there 13 years ago, those villagers had barely learned to forge iron",
                       "Quick! forge me the harpoon",
                       "But I need the original so I know what to forge"],
            translations: ["Кузница"]
        ),
        .init(
            word: "Dome",
            transcription: "[dəʊm]",
            examples: ["The magma dome erupted",
                       "It was under the glass dome, behind the clock, that she hid her bank book",
                       "I've done a sketch of an aviary as well, with a domed roof"],
            translations: ["Купол"]
        ),
        .init(
            word: "Landscape architect",
            transcription: "[ˈlændskeɪp ˈɑːkɪtekt]",
            examples: [
                "If you have a problem with the plants, I can call my landscape architect",
                "And she is marrying the landscape architect",
                "Hey, oh, did you hear that my wife left me for our landscape architect?"
            ],
            translations: ["Ландшафтный архитектор"]
        ),
        .init(
            word: "Neo-Renaissance model",
            transcription: "[ˈmɒdəl]",
            examples: [
                "His night vision system was a far cry from the Patriot model used by the Marines",
                "It was planned as a gigantic experiment in low-rent housing, to serve as model for the whole country; for the whole world",
                "Tony looked around for the model. He could see no one"
            ],
            translations: ["Модель в стиле неоренессанса"]
        ),
        .init(
            word: "Marble",
            transcription: "[ˈmɑːbəl]",
            examples: [
                "White marble",
                "And here's a marble for Lisa for cleaning her room, and a marble for Bart for not trashing Lisa's room",
                "The big blue velour marble"
            ],
            translations: ["Мрамор"]
        ),
        .init(
            word: "Naturalistic garden",
            transcription: "[ˌnætʃrəˈlɪstɪk ˈɡɑːdən]",
            examples: [
                "She turned to look at the garden",
                "The back garden was like the front only more so",
                "In Paris, Tracy stayed at the classic Plaza Athénée, in a lovely old suite that overlooked the garden restaurant"
            ],
            translations: ["Натуралистический сад"]
        ),
        .init(
            word: "Gothic Revival",
            transcription: "[ˈɡɒθɪk rɪˈvaɪvəl]",
            examples: [],
            translations: ["Неоготический стиль"]
        ),
        .init(
            word: "Greek Revival",
            transcription: "[ɡriːk rɪˈvaɪvəl]",
            examples: [
                "Just rehearsing for the revival of Evita",
                "I'm also entering the necessary commands to commence final revival the moment sensors indicate the presence of your expedition team",
                "This would allow him to decide whether the conditions warranted revival of the others"
            ],
            translations: ["Неогрек"]
        ),
        .init(
            word: "Neoclassical",
            transcription: "[ˌnioˈklæsɪkəl]",
            examples: [
                "Paris, you're an MD, a lawyer, an expert on neoclassical architecture, and, I think, a certified dental technician to boot",
                "While today its neoclassical fenestration is considered to be..."
            ],
            translations: ["Неоклассический"]
        ),
        .init(
            word: "Unornamented",
            transcription: "[ˌʌnˈɔːnəmentɪd]",
            examples: [],
            translations: ["Неукрашенный"]
        ),
        .init(
            word: "Primary building material",
            transcription: "[ˈpraɪməri ˈbɪldɪŋ məˈtɪərɪəl]",
            examples: [
                "One of our rules is, you have to preserve the relationship with your primary partner... or you can't participate",
                "We must be absolutely certain of the nature of your primary tumour",
                "The primary act - the process of reason - must be performed by each man alone"
            ],
            translations: ["Основной строительный материал"]
        ),
        .init(
            word: "Mannerism",
            transcription: "[ˈmænərɪzəm]",
            examples: [
                "But mannerisms are remembered, and Cora had certain very definite mannerisms, all of which you had practised carefully before the glass",
                "A person afflicted by hysteria always displays some artificial mannerisms",
                "Mr. Satterthwaite suspected him of deliberately exaggerating his foreign mannerisms"
            ],
            translations: ["Неукрашенный"]
        ),
        .init(
            word: "Mansion",
            transcription: "[ˈmænʃən]",
            examples: [
                "The Charles Stanhope Seniors lived in an impressive old mansion in Rittenhouse Square",
                "Kate chose another architect to design a sixteenth-century French Renaissance mansion on Fifth Avenue",
                "The perfect replica of a Shill Governor's Mansion on Shallanna"
            ],
            translations: ["Особняк"]
        ),
        .init(
            word: "Gabled",
            transcription: "[ˈɡeɪbəld]",
            examples: [
                "She had to live in this bright, red gabled house with the nurse until it was time for her to die",
                "The house was large, red-bricked, and gabled"
            ],
            translations: ["Остроконечный"]
        ),
        .init(
            word: "Remodeling",
            transcription: "[rəˈmɑːdəlɪŋ]",
            examples: [
                "- Uh, yeah, my buddy here, he got stiffed on a kitchen remodel, and the guy owns a plane, we think he keeps it here",
                "Chief organized a revolt against the remodeling of the chapel",
                "Right after we gut and remodel the entire hotel",
            ],
            translations: ["Перепланировка"]
        ),
        .init(
            word: "Kiln for firing brick",
            transcription: "[kɪln fə ˈfaɪərɪŋ brɪk]",
            examples: [
                "It was another half-hour before I drew near to the kiln",
                "The white vapor of the kiln was passing from us as we went by, and as I had thought a prayer before, I thought a thanksgiving now",
                "Philip was seated on the table with all his bricks around him"
            ],
            translations: ["Печь для обжигания кирпича"]
        ),
        .init(
            word: "Piano nobile",
            transcription: "[pɪˈænəʊ ˈnɑːbəl]",
            examples: [
                "Somewhere in the town someone was playing the piano and the music came and went, came and went, softly, drowsily",
                "Miss Willella gives a little jump on the piano stool, and looked at me curious",
                "She went to the piano, picked up her hat and put it on. Her hands were trembling"
            ],
            translations: ["Пиано нобиле", "Главный этаж"]
        ),
        .init(
            word: "Indentured servant",
            transcription: "[ɪnˈdentʃəd ˈsɜːvənt]",
            examples: [
                "Off the ship you were sold as an indentured servant to the one who would take the cost of your skin out in your labor",
                "Won't be an indentured servant anymore",
                "Always acting like I'm his indentured servant"
            ],
            translations: ["Подмастерье"]
        ),
        .init(
            word: "Buttress",
            transcription: "[ˈbʌtrəs]",
            examples: [
                "there was a demand for a new stable order as a buttress against social collapse",
                "we buttressed the wall as it was showing signs of cracking and collapse",
                "authority was buttressed by religious belief"
            ],
            translations: ["Подпорка"]
        ),
        .init(
            word: "Portico",
            transcription: "[ˈpɔːtɪkəʊ]",
            examples: [
                "She ascended the main portico to the church's sole wooden door",
                "If you'll follow me this way, we'll head towards the North Portico",
                "I gotta get out of here and go to Portico"
            ],
            translations: ["Портик", "Галерея"]
        ),
        .init(
            word: "Postmodernism",
            transcription: "[ˌpəʊstˈmɒdənɪzəm]",
            examples: [
                "It's one of the tricky paradoxes of postmodernism, that psychedelics both require and produce a transformative effect",
                "You're right, that is a lovely depiction of postmodernism"
            ],
            translations: ["Постмодернизм"]
        ),
        .init(
            word: "To peg",
            transcription: "[tə peɡ]",
            examples: [
                "Thank you, Peg, I don't deal in wind-instruments",
                "Softly I steal across, lift the peg, pull it out and open the door",
                "His helmet hung on a peg and his face showed clearly"
            ],
            translations: ["Прикреплять колышком"]
        ),
        .init(
            word: "Superintendent",
            transcription: "[ˌsuːpərɪnˈtendənt]",
            examples: [
                "The superintendent of the building told me that one night when Mellis was there, Eve was almost beaten to death",
                "Now, the media's only reporting three, because they don't know about the park superintendent",
                "I should've taken that superintendent job in Honduras"
            ],
            translations: ["Прораб", "Смотритель", "Надзиратель"]
        ),
        .init(
            word: "Expansion",
            transcription: "[ɪkˈspænʃən]",
            examples: [
                "Well, sure, you get a short-term spike, but wouldn't that rapid expansion devalue that stock completely in two years?",
                "Your program is perfect for LeMarchal's expansion into social media",
                "That expansion was my dream"
            ],
            translations: ["Расширение", "Рост", "Экспансия"]
        ),
        .init(
            word: "Sacristy",
            transcription: "[ˈsækrɪsti]",
            examples: [
                "As the bell tolled there came from the sacristy a procession of altar-boys",
                "He even pushed as far as Embrun, entered the cathedral one night, and despoiled the sacristy",
                "Graeber walked past to the pew near the sacristy"
            ],
            translations: ["Ризница", "Сакристия"]
        ),
        .init(
            word: "Romanesque church",
            transcription: "[ˌrəʊməˈnesk tʃɜːtʃ]",
            examples: [],
            translations: ["Романская церковь"]
        ),
        .init(
            word: "Single-aisled",
            transcription: "[ˈsɪŋɡəl aɪld]",
            examples: [],
            translations: ["С одним проходом между рядами (о церкви)", "Однопроходный"]
        ),
        .init(
            word: "Adobe",
            transcription: "[əˈdəʊbi]",
            examples: [
                "Every Adobe update is critical and should be installed immediately",
                "I like adobe better",
                "Adobe dollar"
            ],
            translations: ["Самана", "Необожённый кирпич"]
        ),
        .init(
            word: "Tudor Gothic style",
            transcription: "[ˈtuːdə ˈɡɒθɪk staɪl]",
            examples: [],
            translations: ["Стиль поздней английской готики"]
        ),
        .init(
            word: "Post-and-beam construction",
            transcription: "[kənˈstrʌkʃən]",
            examples: [],
            translations: ["Стоечно-ригельная конструкция"]
        ),
        .init(
            word: "Carpentry shop",
            transcription: "[ˈkɑːpɪntri ʃɒp]",
            examples: [
                "My family ran a carpentry shop for generations",
                "If they would give me back my grandfather's carpentry shop...",
                "There was my grandfather's carpentry shop here, too"
            ],
            translations: ["Столярная мастерская"]
        ),
        .init(
            word: "Pointed arch",
            transcription: "[ˈpɔɪntɪd ɑːtʃ]",
            examples: [
                "It was a pointed arch, lower than the vault, which gradually narrowed, and narrower than the gallery, which closed in as the vault grew lower",
                "With the pointed arches and the ribbed vaults, maybe a flying buttress?",
                "It was the Gothic style with pointed arches and soaring lines"
            ],
            translations: ["Стрельчатая арка"]
        ),
        .init(
            word: "Tepidarium",
            transcription: "[ˌtɛpɪˈdɛːrɪəm]",
            examples: [],
            translations: ["Тепидарий"]
        ),
        .init(
            word: "Sidewalk",
            transcription: "[ˈsaɪdwɔːk]",
            examples: [
                "She walked out of the shop and stood on the sidewalk, uncertainly. Coming to New York had been a mistake",
                "The green bullet in which Faber's voice whispered and cried, fell to the sidewalk",
                "You're scared of sidewalk grates"
            ],
            translations: ["Тротуар", "Бордюр"]
        ),
        .init(
            word: "Embellishment",
            transcription: "[ɪmˈbelɪʃmənt]",
            examples: [
                "I wouldn't, but I'm not willing to throw away a man's entire career over a little embellishment",
                "The embellishments in the oblong room, though old and faded, were replete with familiar symbology",
                "Clear and comprehensive, no embellishments"
            ],
            translations: ["Украшение", "Декорирование"]
        ),
        .init(
            word: "Undecorated stretches",
            transcription: "[ˈstretʃɪz]",
            examples: [],
            translations: ["Участки без отделки"]
        ),
        .init(
            word: "Facade",
            transcription: "[fəˈsɑːd]",
            examples: [
                "Leaning against the railing, he gazed out across town to the illuminated facade of the White House in the distance",
                "You may think it's a facade, and I may agree with you, but that's what a trial is for",
                "Well, that's just part of your facade"
            ],
            translations: ["Фасад", "Видимость", "Показуха"]
        ),
        .init(
            word: "Florentine Renaissance",
            transcription: "[ˈflɔːənˌtin rɪˈneɪsns]",
            examples: [],
            translations: ["Флорентийский ренессанс"]
        ),
        .init(
            word: "Pediment",
            transcription: "[ˈpedɪmənt]",
            examples: [
                "You will, on this pediment, leave more than one feather",
                "With a little pediment, it's very splendid",
                "Vaulted pediment"
            ],
            translations: ["Фронтон", "Сандрик"]
        ),
        .init(
            word: "Eclecticism",
            transcription: "[ɪˈklektɪsɪzəm]",
            examples: [],
            translations: ["Эклектизм", "Эклетицизм"]
        ),
        .init(
            word: "Aesthetic simplicity",
            transcription: "[iːsˈθetɪk sɪmˈplɪsɪti]",
            examples: [
                "The pretty colour of the first, the affected drawing of the second, had entirely satisfied his aesthetic sensibilities",
                "They never let science crush the aesthetic and the beautiful",
                "Forgive and you shall be forgiven and live in aesthetic simplicity",
            ],
            translations: ["Эстетическая простота"]
        ),
    ])
    
    let bagOfGold = BagOfGoldWords(words: ereborGoldWords, typeWord: .architecture, typeTranslation: .enToRu)
    return bagOfGold
}
