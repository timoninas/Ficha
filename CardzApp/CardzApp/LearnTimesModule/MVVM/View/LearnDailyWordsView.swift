//
//  LearnTimesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Rivendell
import Hobbiton
import SwiftUI
import Erebor

struct LearnDailyWordsView : View {
    
    @ObservedObject var learnTimesViewModel: LearnTimesViewModel
    
    @State
    var contentItem: LearnTimesViewModel.Model?
    
    @State
    private var isLearnPresented = false
    
    init(learnTimesViewModel: LearnTimesViewModel) {
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
            .fullScreenCover(isPresented: $learnTimesViewModel.isPresentedOnboarding) {
                OnboardingUserView(model: .init(
                    onboardingModels: [
                        .init(image: .onboarding3, flippedImage: .onboarding4, title: "To see the translation, tap on the card"),
                        .init(image: .onboarding2, title: "Swipe the cards in different directions"),
                        .init(image: .onboarding1, title: "Swipe these cards!")
                    ]
                ))
                .background(Color.gendalf)
            }
            
            self.playButton()

        }
        .onAppear {
            learnTimesViewModel.loadModel()
        }
        .background(Color.gendalf)
        .preferredColorScheme(.dark)
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
    
    @ViewBuilder
    private func playButton() -> some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer()
            HStack(alignment: .center, spacing: 0.0) {
                Spacer()
                LottieView(lottieFile: "PlayButton")
                    .frame(width: 100.0, height: 100.0)
                    .onTapGesture {
                        self.isLearnPresented = !self.isLearnPresented
                        UIApplication.hapticSoft()
                    }
                    .fullScreenCover(isPresented: $isLearnPresented) {
                        LearnCardWrappedView(
                            model: .simpleMode,
                            viewModel: learnTimesViewModel.wordz.map {
                                .init(wordz: $0.title,
                                      translations: $0.translations,
                                      transcription: $0.transcription,
                                      wordzExamples: $0.examples,
                                      type: ArkenstoneTypeWord(rawValue: $0.type) ?? .unknown,
                                      languageVersion: SilverTypeTranslation(rawValue: $0.languageVersion) ?? .unknown,
                                      displayedCount: $0.displayedCount)
                            })
                        .background(Color.gendalf)
                    }
                Spacer()
                    .frame(width: 14.0)
            }
            
            Spacer()
                .frame(height: 8.0)
        }
        
    }
    
}

struct PresentationWordWithTranslateView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            LearnDailyWordsView(learnTimesViewModel: LearnTimesViewModel(model: MockLearnTimesModel()))
        }
    }

}
