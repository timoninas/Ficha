//
//  EdgeInsets+Extension.swift
//  
//
//  Created by Anton Timonin on 08.10.2022.
//

import SwiftUI

public extension EdgeInsets {
    
    // MARK: - Static methods
    
    static func all(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: value,
            leading: value,
            bottom: value,
            trailing: value
        )
    }
    
    static func top(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: value,
            leading: 0.0,
            bottom: 0.0,
            trailing: 0.0
        )
    }
    
    static func right(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: 0.0,
            leading: 0.0,
            bottom: 0.0,
            trailing: value
        )
    }
    
    static func trailing(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: 0.0,
            leading: 0.0,
            bottom: 0.0,
            trailing: value
        )
    }
    
    static func bottom(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: 0.0,
            leading: 0.0,
            bottom: value,
            trailing: 0.0
        )
    }
    
    static func leading(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: 0.0,
            leading: value,
            bottom: 0.0,
            trailing: 0.0
        )
    }
    
    static func left(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: 0.0,
            leading: value,
            bottom: 0.0,
            trailing: 0.0
        )
    }
    
    // MARK: - Public methods
    
    func top(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: value,
            leading: self.leading,
            bottom: self.bottom,
            trailing: self.trailing
        )
    }
    
    func right(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: self.top,
            leading: self.leading,
            bottom: self.bottom,
            trailing: value
        )
    }
    
    func trailing(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: self.top,
            leading: self.leading,
            bottom: self.bottom,
            trailing: value
        )
    }
    
    func bottom(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: self.top,
            leading: self.leading,
            bottom: value,
            trailing: self.trailing
        )
    }
    
    func left(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: self.top,
            leading: value,
            bottom: self.bottom,
            trailing: self.trailing
        )
    }
    
    func leading(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(
            top: self.top,
            leading: value,
            bottom: self.bottom,
            trailing: self.trailing
        )
    }
    
}
