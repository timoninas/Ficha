//
//  WordzModelEntity.swift
//  
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation
 
/// Entity for learning card.
public struct WordzModelEntity: Equatable {
    
    /// Word.
    let wordz: String
    
    /// Transcription of word.
    let transcription: String
    
    /// Examples with usage word.
    let examples: [String]
    
    /// Translation of word to another language.
    let translations: [String]
    
    /// How many count this words has been displayed.
    let displayedCount: Int
    
    /// Type of word.
    let type: TypeWordz
    
    /// Language version of word.
    let languageVersion: String
    
    /// Version of language.
    public enum languageVersion: String {
        /// Translation from English to Russian.
        case ENtoRU = "ENtoRU"
        /// Translation from English to Czech.
        case ENtoCZ = "ENtoCZ"
        /// Translation from English to German.
        case ENtoGRMN = "ENtoGRMN"
        
        /// Declaration in human presentation.
        var declaration: String {
            switch self {
            case .ENtoRU:
                return "From English to Russian"
            case .ENtoCZ:
                return "From English to Czech"
            case .ENtoGRMN:
                return "From English to German"
            }
        }
    }
    
    /// Type of words.
    public enum TypeWordz: Int {
        /// Favourite.
        case favourite = 1
        /// Architecture.
        case architecture = 2
        /// Emotions.
        case emotions = 3
        /// Home.
        case home = 4
        /// Body parts.
        case bodyParts = 5
        /// Instruments.
        case instruments = 6
        /// Sport.
        case sport = 7
        /// Drinks.
        case drinks = 8
        /// Clothes.
        case clothes = 9
        /// Landscape.
        case landscape = 10
        /// Animals.
        case animals = 11
        /// Colors.
        case colors = 12
        /// Job.
        case job = 13
        /// Marketing.
        case marketing = 14
        /// Individ.
        case individ = 15
        
        /// Declaration in human language.
        var declaration: String {
            switch self {
            case .favourite:
                return "Favourite"
            case .architecture:
                return "Architecture"
            case .emotions:
                return "Emotions"
            case .home:
                return "Home"
            case .bodyParts:
                return "Body parts"
            case .instruments:
                return "Instruments"
            case .sport:
                return "Sport"
            case .drinks:
                return "Drinks"
            case .clothes:
                return "Clothes"
            case .landscape:
                return"Landscape"
            case .animals:
                return "Animals"
            case .colors:
                return "Colors"
            case .job:
                return "Job"
            case .marketing:
                return "Marketing"
            case .individ:
                return "Individ"
            }
        }
        
    }
    
}
