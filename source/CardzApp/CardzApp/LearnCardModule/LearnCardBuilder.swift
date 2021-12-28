//
//  LearnCardBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import UIKit
import Rivendell

func getLearnCardViewModel() -> [LearnWordzCardView.ViewModel] {
    
    [ .init(wordz: "beetle",
            translations: ["Трамбовать", "Дробить камни"],
            transcription: "[biːtl]",
            wordzExamples: ["The petrified impression was about three inches long and looked to be the underside of some kind of huge beetle or crawling insect", "Our friend, the click beetle"]),
      .init(wordz:  "To get those subjects",
            translations: ["Чтобы получить эти предметы"],
            wordzExamples: ["There's no use getting on to that subject"]),
      .init(wordz: "Blow someone's head off",
            translations: ["Cнести голову кому-то"],
            wordzExamples: ["A thin black woman was seated in a chair in a corner of the room sewing on a dress", "The little girl watched me, holding the bread against her dirty dress", "She never conformed in dress or conduct"]),
      .init(wordz: "Blow someone's head off",
            translations: ["Cнести голову кому-то"]),
      .init(wordz: "Blow someone's head off",
            translations: ["Cнести голову кому-то"],
            wordzExamples: ["How do you go from eight years of a happy marriage to wanting to blow someone's head off?"]),
      .init(wordz: "Squirrel",
            translations: ["Белка", "Белка", "Белка", "Белка", "Белка", "Белка"],
            transcription: "[ˈskwɪrəl]",
            wordzExamples: ["A squirrel probably got into the attic", "One day a neighbouring cat came to see her, and the squirrel was clearly the subject of their talk", "squirrel food"]),
      .init(wordz: "Squirrel Squirrel Squirrel Squirrel Squirrel",
            translations: ["Белка"],
            transcription: "[ˈskwɪrəl]",
            wordzExamples: ["A squirrel probably got into the attic", "One day a neighbouring cat came to see her, and the squirrel was clearly the subject of their talk", "The petrified impression was about three inches long and looked to be the underside of some kind of huge beetle or crawling insect", "Our friend, the click beetle", "The petrified impression was about three inches long and looked to be the underside of some kind of huge beetle or crawling insect", "Our friend, the click beetle"]),
      .init(wordz: "Squirrel",
            translations: ["Белка", "Белка", "Белка", "Белка", "Белка", "Белка"],
            wordzExamples: ["A squirrel probably got into the attic", "One day a neighbouring cat came to see her, and the squirrel was clearly", "The petrified impression was about three inches long and looked to be the", "The petrified impression was about three inches long and looked to be the underside of some kind of huge beetle or crawling insect"]),
      .init(wordz: "Squirrel kwr eknjjnw jknfjknw fknfkjw fkjnfwjknnfjk wknjfw nkjfe wjknknjfew kjnf ejknf wkknjfw knjfw jkn fwknjwef",
            translations: ["Белка wfhkej wefwhjkfew fehjkfw ekhj wfewhkfje hjkefw hkjwfe jhkwfek kj", "Белка кекекеке фефефефефе", "Белка jkh hk hk hjk khj hjk k h hkj hkj hjk khj khj kj kj", "Белка фе фе фе фе ф е", "Белка wejfk wjk we ffw ekefwhjkfw ekewfhjk ehjkfw fewjefkwefwfewfefjeek", "Белка уц ец ц уц кцу ац цуа уца уца ауц уца ауц ауц а цу ауц ауц уац уац "]) ]
    
}

final class LearnCardBuilder {
    
    public static func build(viewModel: [LearnWordzCardView.ViewModel]) -> UIViewController {
        let presenter = LearnCardPresenter(viewModel: viewModel.shuffled())
        let view = LearnCardViewController(output: presenter)
        presenter.view = view
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        return view
    }
    
}
