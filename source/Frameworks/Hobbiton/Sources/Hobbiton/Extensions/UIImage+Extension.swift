//
//  UIImage+Extension.swift
//  
//
//  Created by Антон Тимонин on 01.11.2021.
//

import UIKit

public extension UIImage {
    
    private static func imageFromBundle(named: String) -> UIImage? {
        UIImage(named: named, in: .module, with: nil)
    }
    
    static let revolvetra = UIImage.imageFromBundle(named: "Revolvetra")
    
    static let settingRoundIcon = UIImage.imageFromBundle(named: "settingsIcon")
    
    static let playGameIcon = UIImage.imageFromBundle(named: "playGameIcon")
    
    static let starUnfilledIcon = UIImage.imageFromBundle(named: "starUnfilledIcon")
    
    static let starFilledIcon = UIImage.imageFromBundle(named: "starFilledIcon")
    
    static let starIcon = UIImage.imageFromBundle(named: "starIcon")
    
    static let todayIcon = UIImage.imageFromBundle(named: "todayIcon")
    
    static let graduateIcon = UIImage.imageFromBundle(named: "graduateIcon")
    
    static let todayIconFilled = UIImage.imageFromBundle(named: "todayIconFilled")
    
    static let starIconFilled = UIImage.imageFromBundle(named: "starIconFilled")
    
    static let graduateIconFilled = UIImage.imageFromBundle(named: "graduateIconFilled")
    
    static let leftArrowIcon = UIImage.imageFromBundle(named: "leftArrowIcon")
    
    static let rightArrowIcon = UIImage.imageFromBundle(named: "rightArrowIcon")
    
    static let openedEye = UIImage.imageFromBundle(named: "openedEye")
    
    static let closedEye = UIImage.imageFromBundle(named: "closedEye")
    
    static let kolokol = UIImage.imageFromBundle(named: "kolokol")
    
    static let closeIcon = UIImage.imageFromBundle(named: "closeIcon")
    
    static let animals = UIImage.imageFromBundle(named: "animals")
    
    static let architecture = UIImage.imageFromBundle(named: "arhitecture")
    
    static let clothes = UIImage.imageFromBundle(named: "clothes")
    
    static let computers = UIImage.imageFromBundle(named: "computers")
    
    static let emotions = UIImage.imageFromBundle(named: "emotions")
    
    static let home = UIImage.imageFromBundle(named: "home")
    
    static let job = UIImage.imageFromBundle(named: "job")
    
    static let slang = UIImage.imageFromBundle(named: "slang")
    
    static let serials = UIImage.imageFromBundle(named: "serials")
    
    static let onboarding1 = UIImage.imageFromBundle(named: "onboarding1")
    
    static let onboarding2 = UIImage.imageFromBundle(named: "onboarding2")
    
    static let onboarding3 = UIImage.imageFromBundle(named: "onboarding3")
    
    static let onboarding4 = UIImage.imageFromBundle(named: "onboarding4")
    
    static let bulbLight = UIImage.imageFromBundle(named: "bulbLight")
    
    static let devIcon = UIImage.imageFromBundle(named: "devIcon")
    
    static let devIconFilled = UIImage.imageFromBundle(named: "devIconFilled")
    
    static let circleDone = UIImage.imageFromBundle(named: "circleDone")
    
    static let doneIcon = UIImage.imageFromBundle(named: "doneIcon")
    
    static let developingModule = UIImage.imageFromBundle(named: "developingModule")
    
    static let developingModuleFilled = UIImage.imageFromBundle(named: "developingModuleFilled")
    
}
