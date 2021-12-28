//
//  OnboardingUserProtocols.swift
//  CardzApp
//
//  Created by Антон Тимонин on 28.12.2021.
//

import Foundation

protocol OnboardingUserViewInput: AnyObject {
    
    func changeState(state: SimpleScreenState<OnboardingUserViewController.ViewModel>)
    
}

protocol OnboardingUserViewOutput: LifeCycleProtocol, AnyObject {
    
}
