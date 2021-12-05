//
//  File.swift
//  
//
//  Created by Антон Тимонин on 09.11.2021.
//

import Foundation

@propertyWrapper
public struct UserDefault<Value> {
    var key: String
    var defaultValue: Value
    var container: UserDefaults = .standard
    
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
