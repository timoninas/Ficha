//
//  AlertCardProtocol.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.11.2021.
//

import Foundation

protocol AlertCardViewInput: AnyObject {
    
    func changeState(state: SimpleScreenState<AlertModel>)
    
}

protocol AlertCardViewOutput: LifeCycleProtocol, AnyObject { }
