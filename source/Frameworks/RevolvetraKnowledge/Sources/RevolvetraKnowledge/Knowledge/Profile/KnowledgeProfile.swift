//
//  KnowledgeProfile.swift
//  
//
//  Created by Антон Тимонин on 09.11.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public protocol KnowledgeProfileProtocol {
    static var isOnborded: Bool { get set }
}

public class KnowledgeProfile: KnowledgeProfileProtocol {
    
    @UserDefault(key: "UD_KnowledgeProfile_isOnborded", defaultValue: false)
    public static var isOnborded
    
}
