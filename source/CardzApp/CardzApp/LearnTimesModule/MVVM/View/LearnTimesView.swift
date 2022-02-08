//
//  LearnTimesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import SwiftUI
import Hobbiton

struct LearnTimesView : View {
    
    @ObservedObject var learnTimesViewModel = LearnTimesViewModel()
    
    var body: some View {
        
        Color.gendalf
            .ignoresSafeArea(edges: .vertical) // Ignore just for the color
            .overlay(
                VStack {
                    Text(learnTimesViewModel.title)
                        .onAppear {
                            learnTimesViewModel.loadModel()
                        }
                }
            )
        
    }
    
}
