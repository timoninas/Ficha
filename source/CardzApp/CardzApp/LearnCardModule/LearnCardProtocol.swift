//
//  LearnCardProtocol.swift
//  CardzApp
//
//  Created by Антон Тимонин on 29.10.2021.
//

import Foundation
import Rivendell

typealias LearnCardViewState = ViewSimpleState<[LearnWordzCardView.ViewModel]>

protocol LearnCardViewInput: AnyObject {
    func changeState(state: LearnCardViewState)
}

protocol LearnCardOutput: LifeCycleProtocol, AnyObject {
    
    func didSwipeCardTop(with index: Int)
    
    func didSwipeCardLeft(with index: Int)
    
    func didSwipeCardRight(with index: Int)
    
    func didDragCard(with index: Int)
    
}
