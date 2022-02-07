//
//  LearnTimesViewModel.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Foundation

class LearnTimesViewModel : ObservableObject, Identifiable {
    
    public var title: String {
        model?.title ?? ""
    }
    
    private var model : LearnTimesModel?
    
    init() {
        loadModel()
    }
    
    public func loadModel() {
        model = LearnTimesModel(title: "Some text")
    }
    
}
