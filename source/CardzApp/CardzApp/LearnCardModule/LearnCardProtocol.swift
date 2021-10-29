//
//  LearnCardProtocol.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import Foundation

protocol LearnCardViewInput: AnyObject {
    func changeState()
}

protocol LearnCardOutput: LifeCycleProtocol, AnyObject {
}
