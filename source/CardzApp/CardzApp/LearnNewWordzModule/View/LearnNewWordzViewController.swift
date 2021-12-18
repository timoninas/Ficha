//
//  LearnNewWordzViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import UIKit
import Rivendell

final class LearnNewWordzViewController: UIViewController {
    
//    let customLayout: NSCollectionLayoutSection = {
//
//        let smallItemsCount = 3
//
//        let smallItemLayout = NSCollectionLayoutItem(
//            layoutSize: .init(
//                widthDimension: .fractionalWidth(1.0 / CGFloat(smallItemsCount)),
//                heightDimension: .fractionalHeight(1.0)
//            )
//        )
//        smallItemLayout.contentInsets = .init(top: 0, leading: 2, bottom: 0, trailing: 2)
//
//        let smallItemGroupLayout = NSCollectionLayoutGroup.horizontal(
//            layoutSize: .init(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1 / 3)
//            ),
//            subitem: smallItemLayout,
//            count: smallItemsCount
//        )
//        smallItemGroupLayout.contentInsets = .init(top: 2, leading: 0, bottom: 2, trailing: 0)
//
//        let bigItemLayout = NSCollectionLayoutItem(
//            layoutSize: .init(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(2 / 3))
//        )
//
//        let commonGroupLayout = NSCollectionLayoutGroup.vertical(
//            layoutSize: .init(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1 / 2)
//            ),
//            subitems: [bigItemLayout, smallItemGroupLayout]
//        )
//
//        return .init(group: commonGroupLayout)
//    }()
    
    let customLayout: NSCollectionLayoutSection = {
        
        let bigItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.65),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        bigItem.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let smallItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.3)
            )
        )
        smallItem.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let smallItemGroupLayout = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.35),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitem: smallItem,
            count: 2
        )
        
        let small3ItemsCount = 3
        
        let small3ItemLayout = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0 / CGFloat(small3ItemsCount)),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        small3ItemLayout.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let small3ItemGroupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.2)
            ),
            subitem: small3ItemLayout,
            count: small3ItemsCount
        )
        small3ItemGroupLayout.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let commonGroupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.4)
            ),
            subitems: [bigItem, smallItemGroupLayout]
        )
        
        let notCommonGroupLayout = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.4)
            ),
            subitems: [smallItemGroupLayout, bigItem]
        )
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let resultGroupLayout = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitems: [notCommonGroupLayout, small3ItemGroupLayout, commonGroupLayout]
        )
        
        let kek = NSCollectionLayoutSection(group: resultGroupLayout)
        kek.boundarySupplementaryItems = [header]
        return kek
    }()
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout(section: customLayout)
        return layout
    }()
    
    var output: LearnNewWordzOutput?
    
    private let thematicView = BubbleThematicWordsView(configuration: .init(title: "Lol Kek cheburek")
                                                        .with(iconImage: .revolvetra)
                                                        .with(backgroundColor: .softGreen)
                                                        .with(cornerRadius: 13.0)
                                                        .with(badgeText: "En→Ru"))
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    init(output: LearnNewWordzOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gendalf
        configureUI()
        output?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
//        view.addSubview(thematicView)
//        NSLayoutConstraint.activate([
//            thematicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
//            thematicView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
//            thematicView.heightAnchor.constraint(equalToConstant: 130.0),
//            thematicView.widthAnchor.constraint(equalToConstant: 100.0),
//        ])
        
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            BubbleThematicWordsCollectionViewCell.self,
            forCellWithReuseIdentifier: BubbleThematicWordsCollectionViewCell.reuseID
        )
        collectionView.register(
            LearnNewWordzCollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: LearnNewWordzCollectionViewHeader.reuseID
        )
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
}

extension LearnNewWordzViewController: LearnNewWordzInput {
    
}

extension LearnNewWordzViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(withReuseIdentifier: BubbleThematicWordsCollectionViewCell.reuseID, for: indexPath)
        
        guard let cell = dequedCell as? BubbleThematicWordsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(configuration: .init(title: "Architecture")
                        .with(iconImage: .architecture)
                        .with(cornerRadius: 13.0)
                        .with(backgroundColor: .softGreen)
                        .with(badgeText: "En~Ru"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LearnNewWordzCollectionViewHeader.reuseID, for: indexPath) as? LearnNewWordzCollectionViewHeader else { return UICollectionReusableView() }
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("kek")
        let module = ThematicWordzBuilder.build(viewModel: .init(title: "Architecture", wordsPreview: WordsPreviews))
        module.modalPresentationStyle = .fullScreen
        self.present(module, animated: true, completion: nil)
    }
    
}

private var WordsPreviews: [PreviewViewModel] = [
    .init(title: "To get out", secondTitles: ["Выйти наружу", "Выбраться отсюда"]),
    .init(title: "To find out", secondTitles: ["Выяснить", "Обнаруживать", "Разузнать"]),
    .init(title: "Words Words Words Words", secondTitles: ["Слова", "Какие-то слова"]),
    .init(title: "Words", secondTitles: ["Слово 1", "Слово 2"]),
    .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 2"]),
    .init(title: "Words", secondTitles: ["Слово", "Слово 1", "Слово 1", "Слово 1", "Слово 1"]),
    .init(title: "Words Wordz 1", secondTitles: ["Слово"]),
    .init(title: "Words KEK", secondTitles: ["Слово MEM"]),
    .init(title: "Words LOL", secondTitles: ["Слово"]),
]
