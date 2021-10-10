//
//  DailyWordsProtocol.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import Foundation

protocol DailyWordsViewInput: AnyObject {
    
}

protocol DailyWordsOutput: AnyObject {
    
    init(view: DailyWordsViewInput)

}
