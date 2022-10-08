//
//  DetailWordCardModel.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import RevolvetraUserDefaults
import SwiftUI
import Erebor

protocol DetailWordCardModelProtocol {
    
    func fetchSegments(viewModel: Segment.ViewModel) -> [Segment.SegmentType]
    
}

final class DetailWordCardModel: DetailWordCardModelProtocol {
    
    func fetchSegments(viewModel: Segment.ViewModel) -> [Segment.SegmentType] {
        var orderedSegments: [Segment.SegmentType] = [
            .title(Segment.TitleBlock(title: viewModel.title))
        ]
        if let transcription = viewModel.transcription {
            orderedSegments.append(.transcription(Segment.TranscriptionBlock(transcription: transcription)))
        }
        if !viewModel.examples.isEmpty {
            orderedSegments.append(.examples(Segment.ExamplesBlock(examples: viewModel.examples)))
        }
        return orderedSegments
            .sorted { $0.order <= $1.order }
    }
    
}
