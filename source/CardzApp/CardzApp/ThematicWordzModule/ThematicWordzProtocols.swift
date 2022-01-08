//
//  ThematicWordzProtocols.swift
//  CardzApp
//
//  Created by Антон Тимонин on 22.12.2021.
//

import Rivendell

protocol ThematicWordzViewInput: AnyObject {
    
    /// Change state of view from external entity .
    /// - Parameters:
    ///   - state: New state of view.
    func changeState(state: SimpleScreenState<ThematicWordzViewController.ViewModel>)
    
}

protocol ThematicWordzViewOutput: LifeCycleProtocol, AnyObject {
    
    /// Add words at index in favourite category.
    /// - Parameters:
    ///   - index: Индекс выбранного слова.
    func addFavourite(at index: Int)
    
}
