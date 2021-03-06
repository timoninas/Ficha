//
//  LifeCycleProtocol.swift
//  CardzApp
//
//  Created by Антон Тимонин on 14.10.2021.
//

import Foundation

protocol LifeCycleProtocol {
    
    func viewDidLoad()
    
    func viewWillAppear()
    
    func viewDidAppear()
    
    func viewWillDisappear()
    
    func viewDidDisappear()
    
}

extension LifeCycleProtocol {
    
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    
    func viewDidAppear() {}
    
    func viewWillDisappear() {}
    
    func viewDidDisappear() {}
    
}
