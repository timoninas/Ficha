//
//  WordResultStorage.swift
//  
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation
import Hobbiton

public protocol WordResultsStorageProtocol {
    
    /// Результирующие слова.
    var words: [WordResult] { get set }
}

public final class WordResultsStorage: WordResultsStorageProtocol {
    
    // MARK: - Properties
    
    public var words: [WordResult] {
        get { _words.wrappedValue }
        set { _words.wrappedValue = newValue }
    }
    
    private var _words: UserDefaultCodable<[WordResult]>
    
    // MARK: - Init
    
    public init(key: String) {
        let container = UserDefaults(suiteName: key) ?? UserDefaults.standard
        self._words = UserDefaultCodable<[WordResult]>(
            key: "UD_Widget_result_words",
            defaultValue: [],
            container: container
        )
    }
}
