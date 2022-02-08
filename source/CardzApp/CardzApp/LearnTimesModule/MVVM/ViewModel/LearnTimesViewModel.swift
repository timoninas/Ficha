//
//  LearnTimesViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Foundation

class LearnTimesViewModel : ObservableObject, Identifiable {
    
    @Published private var model : LearnTimesModel?
    
    public var title: String {
        model?.title ?? ""
    }
    
    public let id = UUID()
    
    init() {}
    
    public func loadModel() {
        model = LearnTimesModel(title: "Some text")
    }
    
}
