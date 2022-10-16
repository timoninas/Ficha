//
//  LearnTimesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Hobbiton
import SwiftUI

struct LearnTimesView : View {
    
    @ObservedObject var learnTimesViewModel: LearnTimesViewModel
    
    @State
    var contentItem: LearnTimesViewModel.LearnWordsViewModel?
    
    init(learnTimesViewModel: LearnTimesViewModel = LearnTimesViewModel()) {
        self.learnTimesViewModel = learnTimesViewModel
    }
    
    var body: some View {
        ZStack {
            self.backgroundBubbles()
            ScrollView(showsIndicators: false) {
                self.header()
                self.listWithWords()
            }
            .fullScreenCover(item: $contentItem) {
                #warning("TODO: Add action for opening screen")
            } content: { item in
                DetailWordView(selectedItem: Segment.ViewModel.adapt(item), items: learnTimesViewModel.wordz.map { Segment.ViewModel.adapt($0) })
            }

        }
        .onAppear {
            learnTimesViewModel.loadModel()
        }
        
    }
    
    @ViewBuilder
    private func header() -> some View {
        LearnTimesHeaderView(title: learnTimesViewModel.headerModel.title,
                             subtitle: learnTimesViewModel.headerModel.subtitle,
                             image: learnTimesViewModel.headerModel.image)
    }
    
    @ViewBuilder
    private func listWithWords() -> some View {
        ForEach(learnTimesViewModel.wordz) { item in
            PresentationWordWithTranslateView(wordz: item.title, examples: item.examples)
                .onTapGesture {
                    contentItem = item
                }
        }
    }
    
    @ViewBuilder
    private func backgroundBubbles() -> some View {
        struct Constants {
            static var firstCircle: CGFloat { 2.5 }
            static var secondCircle: CGFloat { 2.5 }
            static var thirdCircle: CGFloat { 1.75 }
        }
        
        @ViewBuilder
        func buildCircle(sizeValue: CGFloat, color: Color, position: CGSize) -> some View {
            RoundedRectangle(cornerRadius: sizeValue / 2)
                .frame(width: sizeValue,
                       height: sizeValue)
                .foregroundColor(color)
                .offset(position)
        }
        
        return GeometryReader { proxy in
            ZStack(alignment: .center) {
                buildCircle(sizeValue: proxy.size.height / Constants.firstCircle,
                            color: .lightMysteryShack.opacity(0.3),
                            position: CGSize(width: -proxy.size.width / 2.0,
                                             height: proxy.size.height / 6.5))
                buildCircle(sizeValue: proxy.size.height / Constants.secondCircle,
                            color: .lightMysteryShack.opacity(0.3),
                            position: CGSize(width: proxy.size.width / 2.0,
                                             height: -proxy.size.height / 15))
                buildCircle(sizeValue: proxy.size.height / Constants.thirdCircle,
                            color: .lightMysteryShack.opacity(0.3),
                            position: CGSize(width: proxy.size.width / 5.0,
                                             height: proxy.size.height / 1.35))
            }
        }
    }
    
}

struct PresentationWordWithTranslateView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            LearnTimesView(learnTimesViewModel: LearnTimesViewModel(model: MockLearnTimesModel()))
        }
    }

}
