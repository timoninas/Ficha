//
//  DetailWordCardVewModel.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import Combine

class DetailWordCardVewModel : ObservableObject, Identifiable {
    
    @Published var segments: [Segment.SegmentType] = []
    
    private let model: DetailWordCardModelProtocol
    
    init(model: DetailWordCardModelProtocol = DetailWordCardModel()) {
        self.model = model
    }
    
    public func loadModel(viewModel: Segment.ViewModel) {
        segments = model.fetchSegments(viewModel: viewModel)
    }
    
}
