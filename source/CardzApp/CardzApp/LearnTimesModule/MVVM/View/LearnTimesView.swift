//
//  LearnTimesView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 02.02.2022.
//

import Hobbiton
import SwiftUI

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {}
    
}

struct PresentationWordWithTranslateView : View {
    
    var wordz: String
    var examples: [String]
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(spacing: 0.0) {
                self.mainTitle(title: wordz)
                self.examplesTitles(examples: examples)
            }
            .padding(EdgeInsets(top: 12.0,
                                leading: 0.0,
                                bottom: 12.0,
                                trailing: 0.0))
            .background(BlurView(style: .light).cornerRadius(20.0))
            .padding(EdgeInsets(top: 8.0,
                                leading: 12.0,
                                bottom: 8.0,
                                trailing: 12.0))
        }
        
    }
    
    @ViewBuilder
    private func mainTitle(title: String) -> some View {
        HStack(spacing: 0.0) {
            Spacer()
            Text(title)
                .font(.system(size: 36.0, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.mysteryShack)
                .padding(EdgeInsets(top: 0.0,
                                    leading: 16.0,
                                    bottom: 8.0,
                                    trailing: 16.0))
            Spacer()
        }
    }
    
    @ViewBuilder
    private func examplesTitles(examples: [String]) -> some View {
        if examples.filter({ !$0.isEmpty }).isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 8.0) {
                ForEach(examples, id: \.self) {
                    Text($0)
                        .font(.system(size: 20.0, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.nazgul)
                        .padding(EdgeInsets(top: 8.0,
                                            leading: 16.0,
                                            bottom: 0.0,
                                            trailing: 16.0))
                }
                Spacer()
            }
        }
    }
    
}

extension Text {
    public func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View
    {
        self.overlay {
            
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(self)
        }
    }
}

struct LearnTimesHeaderView : View {
    var title: String
    var subtitle: String?
    var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                self.mainTitle(title: title)
                VStack(alignment: .center) {
                    self.titleImage(image: image)
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 8.0,
                            leading: 16.0,
                            bottom: 8.0,
                            trailing: 16.0))
    }
    
    @ViewBuilder
    private func mainTitle(title: String) -> some View {
        Text(title)
            .foregroundLinearGradient(
                colors: [.mysteryShack,
                         .mysteryShack,
                         .mysteryShack,
                         .babushka.opacity(1.0)],
                startPoint: .leading,
                endPoint: .trailing
            )
            .foregroundColor(.nazgul)
            .font(.system(size: 24.0, weight: .bold, design: .rounded))
            .multilineTextAlignment(.leading)
            .lineLimit(1)
    }
    
    @ViewBuilder
    private func titleImage(image: Image?) -> some View {
        if let image {
            
                image
                    .resizable()
                    .frame(width: 13.0,
                           height: 13.0)
        } else {
            EmptyView()
        }
    }
    
}

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
                print("keke")
            } content: { item in
                DetailWordView(items: learnTimesViewModel.wordz)
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
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0.0) {
                RoundedRectangle(cornerRadius: proxy.size.height / 6)
                    .frame(width: proxy.size.height / 3,
                           height: proxy.size.height / 3)
                    .foregroundColor(.lightMysteryShack.opacity(0.3))
                    .offset(CGSize(width: -100, height: 100))
                
                RoundedRectangle(cornerRadius: proxy.size.height / 6)
                    .frame(width: proxy.size.height / 3,
                           height: proxy.size.height / 3)
                    .foregroundColor(.lightMysteryShack.opacity(0.3))
                    .offset(CGSize(width: 200, height: 300))
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

struct DetailWordView : View {
    
    let items: [LearnTimesViewModel.LearnWordsViewModel]
    
    var body: some View {
        VStack {
            TabView {
//                LazyHStack {
                    ForEach(items, id: \.id) { item in
                        CardDetailView(item: item)
                            .background(Color.green)
                            .frame(width: UIScreen.main.bounds.size.width,
                                   height: UIScreen.main.bounds.size.height)
                    }
                    
//                }
            }
            .tabViewStyle(PageTabViewStyle())
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}


struct CardDetailView : View {
    
    @Environment(\.dismiss)
    private var isPresented
    
    let item: LearnTimesViewModel.LearnWordsViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer()
                .frame(height: 100.0)
            HStack {
                VStack {
                    mainTitle(title: item.title)
                    
                    ForEach(item.examples, id: \.self) {
                        Text($0)
                            .font(.system(size: 20.0, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.nazgul)
                            .padding(EdgeInsets(top: 8.0,
                                                leading: 16.0,
                                                bottom: 0.0,
                                                trailing: 16.0))
                    }
                    Text(item.title)
                    Text("Kek")
                        .onTapGesture {
                            isPresented.callAsFunction()
                        }
                }
            }
        }
    }
    
    @ViewBuilder
    private func mainTitle(title: String?) -> some View {
        if let title {
            Text(title)
                .foregroundColor(.nazgul)
                .font(.system(size: 32.0, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
        } else {
            EmptyView()
        }
    }
    
}
