//
//  LearnTimesViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Foundation
import SwiftUI

class LearnTimesViewModel : ObservableObject, Identifiable {
    
    @Published var wordz: [LearnWordsViewModel] = []
    
    @Published var headerModel: HeaderViewModel = .init()
    
    @Published var isPresentedOnboarding: Bool = false
    
    public let id = UUID()
    
    private let model: LearnTimesModelProtocol
    
    init(model: LearnTimesModelProtocol = LearnTimesModel()) {
        self.model = model
    }
    
    public func loadModel() {
        wordz = model.fetchWords()
        headerModel = HeaderViewModel(title: "Daily words", image: .revolvetra)
        isPresentedOnboarding = model.isNeedToPresentOnboarding()
    }
    
}

extension LearnTimesViewModel {
    
    struct LearnWordsViewModel : Identifiable, Decodable, Hashable {
        var id = UUID()
        public var title : String
        public var transcription: String?
        public var translations: [String]
        public var examples: [String]
        
        init(title: String,
             transcription: String?,
             translations: [String] = [],
             examples: [String] = []) {
            self.title = title
            self.transcription = transcription
            self.translations = translations
            self.examples = examples
        }
        
    }
    
    struct HeaderViewModel {
        public var title: String
        public var subtitle: String?
        public var image: Image?
        
        init(title: String = "",
             subtitle: String? = nil,
             image: Image? = nil) {
            self.title = title
            self.subtitle = subtitle
            self.image = image
        }
    }
    
}
