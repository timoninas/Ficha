//
//  File.swift
//  
//
//  Created by Антон Тимонин on 07.12.2021.
//

import Foundation

public protocol KnowledgeDeviceProtocol {
    
    static var appVersion: String? { get }
    
}

public class KnowledgeDevice: KnowledgeDeviceProtocol {
    
    public static var appVersion: String? { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }
    
}
