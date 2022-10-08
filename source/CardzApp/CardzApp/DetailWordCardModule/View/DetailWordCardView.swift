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
                ForEach(items, id: \.self) { item in
                    DetailWordCardView(model: item)
                        .frame(width: UIScreen.main.bounds.size.width - 32.0,
                               height: UIScreen.main.bounds.size.height - 32.0)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            
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
        let transcription: String?
        let examples: [String]
        
        static func adapt(_ model:  LearnTimesViewModel.LearnWordsViewModel) -> ViewModel {
            ViewModel(
                title: model.title,
                transcription: model.transcription,
                examples: model.examples
            )
        }
    }
    
    enum SegmentType: Hashable, Equatable {
        
        case title(TitleBlock)
        
        case transcription(TranscriptionBlock)
        
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
            case .examples:
                return 100
            }
        }
    }
    
    struct TitleBlock: Hashable, Equatable {
        
        let title: String
        
    }
    
    struct TranscriptionBlock: Hashable, Equatable {
        
        let transcription: String
        
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
            }
        }
    }
    
    @ViewBuilder
    private func buildTitle(_ block: Segment.TitleBlock) -> some View {
        Text(block.title)
            .foregroundColor(.nazgul)
            .font(.system(size: 32.0, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private func buildTranscription(_ block: Segment.TranscriptionBlock) -> some View {
        Text(block.transcription)
            .foregroundColor(.nazgul)
            .font(.system(size: 32.0, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private func buildExamples(_ block: Segment.ExamplesBlock) -> some View {
        ForEach(block.examples, id: \.self) {
            Text($0)
                .font(.system(size: 20.0, design: .rounded))
                .multilineTextAlignment(.leading)
                .foregroundColor(.nazgul)
                .padding(EdgeInsets(top: 8.0,
                                    leading: 16.0,
                                    bottom: 0.0,
                                    trailing: 16.0))
        }
    }
    
}

struct DetailWordCardView : View {
    
    @Environment(\.dismiss)
    private var isPresented
    
    let model: Segment.ViewModel
    
    @ObservedObject var detailWordCardVewModel: DetailWordCardVewModel
    
    init(
        model: Segment.ViewModel,
        detailWordCardVewModel: DetailWordCardVewModel = DetailWordCardVewModel()
    ) {
        self.model = model
        self.detailWordCardVewModel = detailWordCardVewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer()
                .frame(height: 100.0)
            HStack {
                LazyVStack {
                    CardDetailChooser(segments: detailWordCardVewModel.segments)
                }
            }
            .onAppear {
                detailWordCardVewModel.loadModel(viewModel: model)
            }
        }
    }
    
}
