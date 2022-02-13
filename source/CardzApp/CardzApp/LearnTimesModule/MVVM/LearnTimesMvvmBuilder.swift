//
//  LearnTimesMvvmBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07/02/2022.
//

import SwiftUI

public final class LearnTimesMvvmBuilder {
    
    static func build() -> UIViewController {
        let view = UIHostingController(rootView: LearnTimesView())
        return view
    }
    
}
