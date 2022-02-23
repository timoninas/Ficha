//
//  UserDefaultPropertyWrapper.swift
//  
//
//  Created by Антон Тимонин on 09.11.2021.
//

import Foundation

@propertyWrapper
public struct UserDefault<Value> {
    public var key: String
    public var defaultValue: Value
    public var container: UserDefaults = .standard
    
    public init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: Value {
        get {
            self.container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            let data: Any = newValue
            switch data {
            case Optional<Any>.none:
                self.container.removeObject(forKey: self.key)
            default:
                self.container.set(data, forKey: self.key)
            }
        }
    }
}
