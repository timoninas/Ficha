//
//  UserDefaultCodable.swift
//  
//
//  Created by Anton Timonin on 03.01.2024.
//

import Foundation

public class UserDefaultCodable<Value: Codable> {
    
    // MARK: - Public properties
    
    public var key: String
    public var defaultValue: Value
    public var container: UserDefaults
    
    // MARK: - Init
    
    public init(key: String,
                defaultValue: Value,
                container: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
    }
    
    // MARK: - Public property
    
    public var wrappedValue: Value {
        get {
            let decoder = JSONDecoder()
            guard let object = container.object(forKey: key) as? Data,
                  let decodedValue = try? decoder.decode(Value.self, from: object)
            else {
                return defaultValue
            }
            return decodedValue
        }
        set {
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(newValue) else { return }
            container.set(encoded, forKey: key)
        }
    }
}
