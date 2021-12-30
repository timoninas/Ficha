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
    /// Неизвестно.
    case unknown = "Unknown"
}