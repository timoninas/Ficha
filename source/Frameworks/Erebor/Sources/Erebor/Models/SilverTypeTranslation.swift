//
//  SilverTypeTranslation.swift
//  
//
//  Created by Антон Тимонин on 21.12.2021.
//

import Foundation

/// Тип перевода слов.
public enum SilverTypeTranslation: String, Encodable, Decodable {
    /// С английского на русский.
    case enToRu = "En~Ru"
    /// С английского на чешский.
    case enToCz = "En~Cz"
    /// С английского на германский.
    case enToD = "En~D"
    /// Неизвестный перевод.
    case unknown = ""
}
