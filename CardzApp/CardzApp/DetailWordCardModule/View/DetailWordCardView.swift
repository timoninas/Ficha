//
//  DetailWordCardView.swift
//  CardzApp
//
//  Created by Anton Timonin on 08.10.2022.
//

import Hobbiton
import SwiftUI

struct DetailWordView : View {
    
    let selectedItem: Segment.ViewModel
    
    let items: [Segment.ViewModel]
    
    @Environment(\.dismiss)
    private var isPresented
    
    var body: some View {
        ZStack {
            TabView {
                    DetailWordCardView(model: selectedItem)
                        .frame(width: UIScreen.main.bounds.size.width - 40.0,
                               height: UIScreen.main.bounds.size.height - 40.0)
            }
            .tabViewStyle(PageTabViewStyle())
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(Color.whisper)
            
            closeButtonView()
        }
    }
    
    @ViewBuilder
    private func closeButtonView() -> some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isPresented.callAsFunction()
                } label: {
                    Image.closeIcon
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.accentColor)
                        .padding(EdgeInsets.all(16.0))
                }
            }
            Spacer()
        }
        
    }
}



struct Segment {
    
    struct ViewModel: Hashable {
        let title: String
        let translations: [String]
        
        static func adapt(_ model:  LearnTimesViewModel.Model) -> ViewModel {
            ViewModel(
                title: model.title,
                translations: model.translations
            )
        }
    }
    
    enum SegmentType: Hashable, Equatable {
        
        case title(TitleBlock)
        
        case transcription(TranscriptionBlock)
        
        case translations(TranslationsBlock)
        
        case tag(TagBlock)
        
        case examples(ExamplesBlock)
        
        static func == (lhs: Segment.SegmentType, rhs: Segment.SegmentType) -> Bool {
            switch (lhs, rhs) {
            case (.title(let lhsBlock), .title(let rhsBlock)):
                return lhsBlock == rhsBlock
            case (.transcription(let lhsBlock), .transcription(let rhsBlock)):
                return lhsBlock == rhsBlock
            case (.examples(let lhsBlock), .examples(let rhsBlock)):
                return lhsBlock == rhsBlock
            default:
                return false
            }
        }
        
        var order: Int {
            switch self {
            case .title:
                return 0
            case .transcription:
                return 50
            case .tag:
                return 100
            case .translations:
                return 150
            case .examples:
                return 200
            }
        }
    }
    
    struct TitleBlock: Hashable, Equatable {
        
        let title: String
        
    }
    
    struct TranscriptionBlock: Hashable, Equatable {
        
        let transcription: String
        
    }
    
    struct TagBlock: Hashable, Equatable {
        
        let tag: String
        
    }
    
    struct TranslationsBlock: Hashable, Equatable {
        
        let translations: [String]
        
    }
    
    struct ExamplesBlock: Hashable, Equatable {
        
        let examples: [String]
        
    }
    
}

struct CardDetailChooser: View {
    
    let segments: [Segment.SegmentType]
    
    var body: some View {
        ForEach(segments, id: \.self) { segment in
            switch segment {
            case .title(let block):
                buildTitle(block)
            case .transcription(let block):
                buildTranscription(block)
            case .examples(let block):
                buildExamples(block)
            case .tag(let block):
                buildTag(block)
            case .translations(let block):
                buildTranslations(block)
            }
        }
    }
    
    @ViewBuilder
    private func buildTitle(_ block: Segment.TitleBlock) -> some View {
        Text(block.title)
            .font(.system(size: 72.0, weight: .bold, design: .rounded))
            .foregroundColor(.mysteryShack)
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private func buildTranscription(_ block: Segment.TranscriptionBlock) -> some View {
        Text(block.transcription)
            .foregroundColor(.nazgul)
            .font(.system(size: 32.0, weight: .semibold, design: .rounded))
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private func buildExamples(_ block: Segment.ExamplesBlock) -> some View {
        VStack(spacing: 0.0) {
            HStack {
                Text("Examples")
                    .foregroundColor(.nazgul)
                    .font(.system(size: 24.0, weight: .bold, design: .rounded))
                Spacer()
            }
            Spacer()
                .frame(height: 8.0)
            ForEach(block.examples, id: \.self) { example in
                HStack(spacing: 0.0) {
                    Text(example)
                        .font(.system(size: 18.0, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.nazgul)
                        .lineSpacing(3.0)
                    Spacer()
                }
                .padding(.bottom(10.0))
            }
        }
        .padding(.top(10.0).bottom(10.0))
    }
    
    @ViewBuilder
    private func buildTag(_ block: Segment.TagBlock) -> some View {
        VStack(spacing: 0.0) {
            Text(block.tag)
                .padding(EdgeInsets.top(2.0).bottom(2.0).leading(10.0).trailing(10.0))
                .font(.system(size: 15.0, design: .rounded))
                .foregroundColor(.whisper)
                .multilineTextAlignment(.center)
                .background(Color.mysteryShack.opacity(0.8))
                .cornerRadius(13.0)
        }
        .padding(.top(12.0).bottom(12.0))
    }
    
    @ViewBuilder
    private func buildTranslations(_ block: Segment.TranslationsBlock) -> some View {
        VStack(spacing: 0.0) {
            HStack {
                Text("Translation")
                    .foregroundColor(.nazgul)
                    .font(.system(size: 24.0, weight: .bold, design: .rounded))
                Spacer()
            }
            Spacer()
                .frame(height: 8.0)
            ForEach(block.translations, id: \.self) { translation in
                HStack {
                    Text(translation)
                        .foregroundColor(.nazgul)
                        .font(.system(size: 18.0, weight: .regular, design: .rounded))
                    Spacer()
                }
                .padding(.bottom(10.0))
                
            }
        }
        Divider()
    }
    
}

struct DetailWordCardView : View {
    
    @Environment(\.dismiss)
    private var isPresented
    
    let model: Segment.ViewModel
    
    @ObservedObject var detailWordCardVewModel: DetailWordCardViewModel
    
    init(
        model: Segment.ViewModel,
        detailWordCardVewModel: DetailWordCardViewModel = DetailWordCardViewModel()
    ) {
        self.model = model
        self.detailWordCardVewModel = detailWordCardVewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer()
                .frame(height: UIApplication.statusBarHeight)
            HStack {
                VStack(spacing: 0.0) {
                    CardDetailChooser(segments: detailWordCardVewModel.segments)
                }
            }
            .onAppear {
                detailWordCardVewModel.loadModel(viewModel: model)
            }
        }
    }
    
}
