//
//  ThematicWordzProtocols.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Rivendell

protocol ThematicWordzViewInput: AnyObject {
    
    func changeState(state: SimpleScreenState<ThematicWordzViewController.ViewModel>)
    
}

protocol ThematicWordzViewOutput: LifeCycleProtocol, AnyObject {
    
}
