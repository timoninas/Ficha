//
//  ArkenstoneTypeWord.swift
//  
//
//  Created by Антон Тимонин on 21.12.2021.
//

import Foundation

public var arkenstones: [ArkenstoneTypeWord] = [
    .home,
    .computers,
    .architecture,
    .animals,
    .serials,
    .emotions,
    .clothes,
    .job,
    .slang,
    .favourite,
    .unknown
]

/// Тип тематических слов.
public enum ArkenstoneTypeWord: String, CaseIterable, Decodable, Encodable {
    /// Архитектура.
    case architecture = "Architecture"
    /// Компьютеры.
    case computers = "Computers"
    /// Эмоции.
    case emotions = "Emotions"
    /// Дом.
    case home = "Home"
    /// Животные.
    case animals = "Animals"
    /// Работа.
    case job = "Job"
    /// Одежда.
    case clothes = "Clothes"
    /// Сериалы.
    case serials = "Serials"
    /// Слэнг.
    case slang = "Slang"
    /// Избранные.
    case favourite = "Favourite"
    /// Эмодзи.
    case emoji = "Emoji"
    /// Неизвестно.
    case unknown = "Unknown"
    
    public static func allowedTypes() -> [ArkenstoneTypeWord] {
        let restrictedTypes: [ArkenstoneTypeWord] = [.slang, .emoji]
        var result: [ArkenstoneTypeWord] = []
        ArkenstoneTypeWord.allCases.forEach { type in
            guard !restrictedTypes.contains(type) else { return }
            result.append(type)
        }
        return result
    }
}
