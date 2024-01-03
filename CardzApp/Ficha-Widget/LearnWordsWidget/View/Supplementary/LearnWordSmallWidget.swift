//
//  LearnWordSmallWidget.swift
//  Ficha-WidgetExtension
//
//  Created by Anton Timonin on 25.12.2023.
//

import WidgetKit
import SwiftUI
import AppIntents
import Hobbiton

struct LearnWordSmallWidget: View {
    
    // MARK: - Properties
    
    var state: LearnWordWidgetEntryView.State
    
    var toLeftAppIntent: any AppIntent
    var toRightAppIntent: any AppIntent
    var flipAppIntent: any AppIntent
    
    private var transition: AnyTransition {
        guard case let .word(word) = state,
              let action = word.action else { 
            return .identity
        }
        switch action {
        case .leftSwipe(let fromLeft):
            return .asymmetric(insertion: .push(from: .leading),
                               removal: fromLeft 
                                   ? .push(from: .leading)
                                   : .push(from: .trailing))
        case .rightSwipe(let fromLeft):
            return .asymmetric(insertion: .push(from: .trailing),
                               removal: fromLeft 
                                   ? .push(from: .trailing)
                                   : .push(from: .leading))
        case .flipToTranslation,
                .flipToWord:
            return .identity
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            CustomGradientView(typeGradient: .angled,
                               firstColor: .lightPurrple,
                               secondColor: .darkPurrple)
            switch state {
            case let .word(word):
                contentView(word)
            case let .inform(inform):
                informView(inform)
            }
            
        }
        .containerBackground(Color.clear, for: .widget)
    }
    
    // MARK: - Methods
    
    @ViewBuilder
    func contentView(_ word: LearnWordWidgetEntryView.Word) -> some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Button(intent: flipAppIntent) {
                LearnWordCard(title: word.title)
                    .transition(transition)
            }.buttonStyle(.plain)
            HStack {
                buildButton(image: .starUnfilledIcon,
                            color: .softYellow,
                            intent: toLeftAppIntent)
                .padding(.leading(4.0))
                
                Spacer()
                buildButton(image: .rightArrowIconThin,
                            color: .softGreen,
                            intent: toRightAppIntent)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.all(8.0))
        .id("\(state.hashValue)")
    }
    
    @ViewBuilder
    func informView(_ inform: LearnWordWidgetEntryView.Inform) -> some View {
        VStack(spacing: 8.0) {
            Image.searchIcon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.whisper)
                .frame(width: 40.0, height: 40.0)
            if let title = inform.title {
                Text(title)
                    .font(.system(size: 18,
                                   weight: .heavy,
                                   design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .foregroundColor(.whisper)
            }
        }
        .padding(.all(8.0))
    }
    
    @ViewBuilder
    func buildButton(image: UIImage?,
                     color: Color,
                     intent: any AppIntent) -> some View {
        Button(intent: intent) {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .renderingMode(.template)
                .foregroundColor(color)
                .frame(width: 30.0, height: 30.0)
        }
        .buttonStyle(.plain)
    }
    
}

// MARK: - Preview

#Preview(as: .systemSmall) {
    LearnWordWidget()
} timeline: {
    LearnWordWidgetEntry(date: Date(), word: .init(title: "Hello world", 
                                                   action: .flipToTranslation))
    LearnWordWidgetEntry(date: Date(), word: .init(title: "Обрезать",
                                                   action: .flipToTranslation))
    LearnWordWidgetEntry(date: Date(), word: .init(title: "jernfwernfjkerwnfkwjernfk",
                                                   action: .flipToTranslation))
}
