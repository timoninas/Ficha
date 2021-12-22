//
//  ArkenstoneTypeWord.swift
//  
//
//  Created by Антон Тимонин on 21.12.2021.
//

import Foundation

/// Тип тематических слов.
public enum ArkenstoneTypeWord: String, CaseIterable {
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
    /// Рандомные.
    case random = "Random"
    /// Избранные.
    case favourite = "Favourite"
}
