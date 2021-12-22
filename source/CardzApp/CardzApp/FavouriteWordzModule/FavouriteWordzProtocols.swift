//
//  FavouriteWordzProtocols.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import Foundation

protocol FavouriteWordzViewInput: AnyObject {
    func changeState(state: SimpleScreenState<[FavouriteWordzViewController.ViewModel]>)
}

protocol FavouriteWordzViewOutput: LifeCycleProtocol, AnyObject {
    
}
