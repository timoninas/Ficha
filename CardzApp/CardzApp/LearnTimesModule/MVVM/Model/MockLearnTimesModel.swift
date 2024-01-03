//
//  MockLearnTimesModel.swift
//  CardzApp
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation

final class MockLearnTimesModel: LearnTimesModelProtocol {
    
    func fetchWords() -> [LearnTimesViewModel.Model] {
        [
            LearnTimesViewModel.Model(title: "1123", transcription: "[awefawe]", examples: ["Lol", "Kek", "Cheburek"], languageVersion: "", displayedCount: 0),
            LearnTimesViewModel.Model(title: "rejkngjkwegjkner", transcription: "[o0o]", examples: [], languageVersion: "", displayedCount: 0),
            LearnTimesViewModel.Model(title: "Ololoolo", transcription: "[123]", examples: ["", "", ""], languageVersion: "", displayedCount: 0)
        ]
    }
    
    func releaseResultWords() { }
    
    func isNeedToPresentOnboarding() -> Bool {
        false
    }
    
}
