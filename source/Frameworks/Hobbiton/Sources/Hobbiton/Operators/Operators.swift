//
//  Operators.swift
//  
//
//  Created by Антон Тимонин on 04.11.2021.
//

import Foundation

precedencegroup PipeOperatorPrecedence {
    associativity: left
    higherThan: DefaultPrecedence
}

precedencegroup FunctionCompositionPrecedence {
    associativity: left
    higherThan: PipeOperatorPrecedence
}

infix operator >>> : PipeOperatorPrecedence

/**
 Composition functions.
 
 ````
 let result = { print("kek") >>> print("lol") }
 result()
 
 # Console ouput
 # kek
 # lol
 ````
 */
public func >>> (lhsF: @escaping () -> Void, rhsF: @escaping () -> Void) -> (() -> Void) {
    return {
        lhsF()
        rhsF()
    }
}

infix operator >>- : PipeOperatorPrecedence

/**
 Unwrap options variables.
 
 ````
 let num: Int? = 3
 
 num >>- { print($0) }
 
 # Console ouput
 # 3
 ````
 */
@discardableResult
public func >>- <T>(lhs: T?, rhsF: @escaping (T) -> Void) -> T? {
    switch lhs {
    case .some(let unwrapLhs):
        rhsF(unwrapLhs)
        return unwrapLhs
    case .none:
        return nil
    }
}

precedencegroup ForwardComposition {
    associativity: left
}

infix operator >--> :  ForwardComposition

public func >--> <A, B, C>(left: @escaping (A) -> B, right: @escaping (B) -> C) -> (A) -> C {
    return { right(left($0)) }
}
