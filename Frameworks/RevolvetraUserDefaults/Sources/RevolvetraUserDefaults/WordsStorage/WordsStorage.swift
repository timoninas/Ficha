//
//  WordsStorage.swift
//  
//
//  Created by Anton Timonin on 28.12.2023.
//

import Foundation
import RevoletraUserDefaultsKeys
import Hobbiton

public protocol WordsStorageProtocol {
    
    /// Хранящиеся слова.
    var words: [Word] { get set }
    
    /// Перевёрнута ли карточка.
    var isFlipped: Bool { get set }
    
    /// Последние выполненое действие с карточкой.
    var lastAction: ActionType? { get set }
    
    /// Предпоследнее выполненное действие с карточкой.
    var previousAction: ActionType? { get set }
    
    /// Переворачивает карточку.
    func flip()
    
    /// Свайпает карточку.
    /// - Parameter actionType: Тип свайпа.
    func swipeCard(_ actionType: ActionType)
    
    /// Обнулить состояния хранилища.
    func reset()
}

public final class WordsStorage: WordsStorageProtocol {
    
    // MARK: - Properties
    
    public var words: [Word] {
        get { _words.wrappedValue }
        set { _words.wrappedValue = newValue }
    }
    
    public var isFlipped: Bool {
        get { _isFlipped.wrappedValue }
        set { _isFlipped.wrappedValue = newValue }
    }
    
    public var lastAction: ActionType? {
        get { _lastAction.wrappedValue }
        set {
            _previousAction.wrappedValue = lastAction
            _lastAction.wrappedValue = newValue
        }
    }
    
    public var previousAction: ActionType? {
        get { _previousAction.wrappedValue }
        set { _previousAction.wrappedValue = newValue }
    }
    
    private var _words: UserDefaultCodable<[Word]>
    
    private var _isFlipped: UserDefaultCodable<Bool>
    
    private var _lastAction: UserDefaultCodable<ActionType?>
    
    private var _previousAction: UserDefaultCodable<ActionType?>
    
    private var resultStorage: WordResultsStorageProtocol?
    
    // MARK: - Init
    
    public init(key: String,
                resultStorage: WordResultsStorageProtocol? = nil) {
        let container = UserDefaults(suiteName: key) ?? UserDefaults.standard
        self._words = UserDefaultCodable<[Word]>(
            key: "UD_Widget_words",
            defaultValue: [],
            container: container
        )
        self._isFlipped = UserDefaultCodable<Bool>(
            key: "UD_Widget_isFlipped",
            defaultValue: false,
            container: container
        )
        self._lastAction = UserDefaultCodable<ActionType?>(
            key: "UD_Widget_lastAction",
            defaultValue: nil,
            container: container
        )
        self._previousAction = UserDefaultCodable<ActionType?>(
            key: "UD_Widget_previousAction",
            defaultValue: nil,
            container: container
        )
        self.resultStorage = resultStorage
    }
    
    // MARK: - Methods
    
    public func flip() {
        self.isFlipped = !self.isFlipped
        self.lastAction = nil
    }
    
    public func swipeCard(_ actionType: ActionType) {
        self.lastAction = actionType
        self.isFlipped = false
        let word = self.words.removeFirst()
        // Добавляем в результирующее хранилище.
        self.resultStorage?.words.append(.init(word: word, actionType: actionType))
    }
    
    public func reset() {
        self.isFlipped = false
        self.lastAction = nil
        self.lastAction = nil
        self.words = []
    }
}
