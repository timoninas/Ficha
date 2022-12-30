//
//  LearnCard.swift
//  CardzApp
//
//  Created by Anton Timonin on 30.12.2022.
//

import Rivendell
import SwiftUI

struct LearnCardWrappedView: UIViewControllerRepresentable {
    typealias UIViewControllerType = LearnCardViewController
    
    private let model: CardLearnModel
    private let viewModel: [LearnWordzCardView.ViewModel]
    
    public init(model: CardLearnModel, viewModel: [LearnWordzCardView.ViewModel]) {
        self.model = model
        self.viewModel = viewModel
    }
    
    func makeUIViewController(context: Context) -> LearnCardViewController {
        let module = goJourney(.learnCard(mode: model, viewModel: viewModel)) as? LearnCardViewController
        return module!
    }
    
    func updateUIViewController(_ uiViewController: LearnCardViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
