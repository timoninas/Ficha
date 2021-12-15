//
//  Operators.swift
//  
//
//  Created by Антон Тимонин on 04.11.2021.
//

import Foundation

precedencegroup ForwardComposition {
    associativity: left
}

infix operator >>> :  ForwardComposition

func >>> <A, B, C>(left: @escaping (A) -> B, right: @escaping (B) -> C) -> (A) -> C {
    return { right(left($0)) }
}
