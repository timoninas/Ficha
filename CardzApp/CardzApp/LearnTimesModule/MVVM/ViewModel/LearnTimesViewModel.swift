//
//  LearnTimesViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Foundation
import SwiftUI
import RevolvetraUserDefaults
import RevoletraUserDefaultsKeys

class LearnTimesViewModel : ObservableObject, Identifiable {
    
    @Published var wordz: [Model] = []
    
    @Published var headerModel: HeaderViewModel = .init()
    
    @Published var isPresentedOnboarding: Bool = false
    
    public let id = UUID()
    
    private let model: LearnTimesModelProtocol
    
    init(model: LearnTimesModelProtocol) {
        self.model = model
    }
    
    public func loadModel() {
        wordz = model.fetchWords()
        model.releaseResultWords()
        headerModel = HeaderViewModel(title: "Daily words", image: .revolvetra)
        isPresentedOnboarding = model.isNeedToPresentOnboarding()
    }
    
}

extension LearnTimesViewModel {
    
    struct Model : Identifiable, Decodable, Hashable {
        var id = UUID()
        public var title : String
        public var transcription: String?
        public var translations: [String]
        public var examples: [String]
        public var type: String
        public var languageVersion: String
        public var displayedCount: Int64
        
        init(title: String,
             transcription: String?,
             translations: [String] = [],
             examples: [String] = [],
             type: String = "",
             languageVersion: String,
             displayedCount: Int64) {
            self.title = title
            self.transcription = transcription
            self.translations = translations
            self.examples = examples
            self.type = type
            self.languageVersion = languageVersion
            self.displayedCount = displayedCount
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
