//
//  DetailWordCardViewModel.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import Foundation
import Combine

class DetailWordCardViewModel : ObservableObject, Identifiable {
    
    @Published var segments: [Segment.SegmentType] = []
    
    private let model: DetailWordCardModelProtocol
    
    init(model: DetailWordCardModelProtocol = DetailWordCardModel()) {
        self.model = model
    }
    
    public func loadModel(viewModel: Segment.ViewModel) {
        self.model.fetchSegments(viewModel: viewModel, completion: { [weak self] segments in
            guard let self = self else { return }
            guard self.segments != segments else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.segments = segments
            }
        })
    }
    
}
