//
//  LearnTimesProtocols.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Foundation

protocol LearnTimesViewInput: AnyObject {
    
    func changeState(state: LearnTimesViewState)
}

protocol LearnTimesOutput: LifeCycleProtocol, AnyObject { }
