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
    
    public let id = UUID()
    
    private let model: LearnTimesModelProtocol
    
    init(model: LearnTimesModelProtocol = LearnTimesModel()) {
        self.model = model
    }
    
    public func loadModel() {
        wordz = model.fetchWords()
        headerModel = HeaderViewModel(title: "Daily words", image: .revolvetra)
    }
    
}

extension LearnTimesViewModel {
    
    struct LearnWordsViewModel : Identifiable, Decodable, Hashable {
        var id = UUID()
        public var title : String
        public var transcription: String?
        public var examples: [String]
        
        init(title: String,
             transcription: String?,
             examples: [String] = []) {
            self.title = title
            self.transcription = transcription
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
