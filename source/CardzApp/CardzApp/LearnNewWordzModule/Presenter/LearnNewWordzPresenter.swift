//
//  LearnNewWordzPresenter.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation
import Erebor

final class LearnNewWordzPresenter: LearnNewWordzOutput {
    
    weak var view: LearnNewWordzInput?
    
    private var words: [ArkenstoneTypeWord] = [
        .home,
        .computers,
        .architecture,
        .animals,
        .serials,
        .emotions,
        .clothes,
        .job,
        .random
    ]
    
    init() {
        
    }
    
    func viewDidLoad() {
        view?.changeState(
            state: .normal(
                model: .init(
                    items: [
                        .init(title: words[0].rawValue,
                              image: .home,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[1].rawValue,
                              image: .computers,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[2].rawValue,
                              image: .architecture,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[3].rawValue,
                              image: .animals,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[4].rawValue,
                              image: .serials,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[5].rawValue,
                              image: .emotions,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[6].rawValue,
                              image: .clothes,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[7].rawValue,
                              image: .job,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                        .init(title: words[8].rawValue,
                              image: .random,
                              badgeText: SilverTypeTranslation.enToRu.rawValue),
                    ]
                )
            )
        )
    }
    
}
