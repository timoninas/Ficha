//
//  KnowledgeDevice.swift
//  
//
//  Created by Антон Тимонин on 07.12.2021.
//

import Foundation
import RevoletraUserDefaultsKeys

public protocol KnowledgeDeviceProtocol {
    
    static var appVersion: String? { get }
    
    static var previousAppVersion: String { get set }
    
}

public class KnowledgeDevice: KnowledgeDeviceProtocol {
    
    public static var appVersion: String? { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }
    
    @UserDefault(key: DeviceKey.previousAppVersion, defaultValue: "")
    public static var previousAppVersion
}
