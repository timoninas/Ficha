//
//  WordzModelDB.swift
//  CardzApp
//
//  Created by Антон Тимонин on 30.12.2021.
//

import Foundation
import Erebor

public struct WordzModelDB {
    
    var wordz: String
    
    var transcription: String?
    
    var examples: [String]
    
    var translations: [String]
    
    var type: ArkenstoneTypeWord
    
    var languageVersion: SilverTypeTranslation
    
    var displayedCount: Int64
    
}
