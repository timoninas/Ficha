//
//  DetailWordCardModel.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import RevolvetraUserDefaults
import Hobbiton
import SwiftUI
import Erebor

protocol DetailWordCardModelProtocol {
    
    func fetchSegments(viewModel: Segment.ViewModel, completion: (([Segment.SegmentType]) -> Void)?)
    
}

final class DetailWordCardModel: DetailWordCardModelProtocol {
    
    func fetchSegments(viewModel: Segment.ViewModel, completion: (([Segment.SegmentType]) -> Void)?) {
            guard let response = MoriaManager.shared.getWordz(word: viewModel.title, translations: viewModel.translations).first else {
                DispatchQueue.main.async {
                    completion?([])
                }
                return
            }
            var segments: [Segment.SegmentType] = [
                .title(Segment.TitleBlock(title: response.wordz))
            ]
            if let transcription = response.transcription {
                segments.append(.transcription(Segment.TranscriptionBlock(transcription: transcription)))
            }
            if !response.examples.filter({ !$0.isEmpty }).isEmpty {
                segments.append(.examples(Segment.ExamplesBlock(examples: response.examples)))
            }
            if !response.translations.filter({ !$0.isEmpty }).isEmpty {
                segments.append(.translations(Segment.TranslationsBlock(translations: response.translations)))
            }
            segments.append(.tag(Segment.TagBlock(tag: response.type.rawValue)))
            let orderedSegments = segments.sorted(by: { $0.order < $1.order })
            DispatchQueue.main.async {
                completion?(orderedSegments)
            }
        
    }
    
}
