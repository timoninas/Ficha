//
//  LearnNewWordzInterface.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import Foundation

protocol LearnNewWordzInput: AnyObject {
    
    func changeState(state: SimpleScreenState<LearnNewWordzViewController.ViewModel>)
}

protocol LearnNewWordzOutput: LifeCycleProtocol, AnyObject { }
