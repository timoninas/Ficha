//
//  ViewSimpleState.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.12.2021.
//

import Foundation

enum ViewSimpleState<T> {
    case content(T)
    case error
}
