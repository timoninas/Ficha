//
//  LearnTimesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import SwiftUI

struct LearnTimesView : View {
    
    var learnTimesViewModel = LearnTimesViewModel()

    var body: some View {
        Text(learnTimesViewModel.title)
    }
    
}
