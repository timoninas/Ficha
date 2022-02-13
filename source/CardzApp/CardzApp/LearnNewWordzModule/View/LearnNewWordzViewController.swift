//
//  LearnNewWordzViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 15.12.2021.
//

import UIKit
import Rivendell
import Erebor

final class LearnNewWordzViewController: UIViewController {
    
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
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let resultGroupLayout = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitems: [notCommonGroupLayout, small3ItemGroupLayout, commonGroupLayout]
        )
        
        let layoutSection = NSCollectionLayoutSection(group: resultGroupLayout)
        layoutSection.boundarySupplementaryItems = [header]
        return layoutSection
    }()
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout(section: customLayout)
        return layout
    }()
    
    var output: LearnNewWordzOutput?
    
    private var viewModel: ViewModel = .init(items: []) {
        didSet {
            guard self.viewModel.items != oldValue.items else { return }
            collectionView.reloadData()
        }
    }
    
    private var colors: [UIColor] = [
        .softGreen,
        .softOrange,
        .softPurple,
        .softBlue,
        .softYellow,
        .softPink,
        .softRed
    ]
    
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
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private func configureUI() {
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
    
    func changeState(state: SimpleScreenState<LearnNewWordzViewController.ViewModel>) {
        switch state {
        case .normal(model: let viewModel):
            self.viewModel = viewModel
        case .error:
            RLogDebug(message: "Change state to error", subsystem: String(describing: self))
        }
    }
    
}

extension LearnNewWordzViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(withReuseIdentifier: BubbleThematicWordsCollectionViewCell.reuseID, for: indexPath)
        
        guard let cell = dequedCell as? BubbleThematicWordsCollectionViewCell else { return UICollectionViewCell() }
        let item = viewModel.items[indexPath.row]
        cell.configure(configuration: .init(title: item.title)
                        .with(iconImage: item.image)
                        .with(cornerRadius: 13.0)
                        .with(backgroundColor: colors[indexPath.row % colors.count])
                        .with(badgeText: item.badgeText))
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LearnNewWordzCollectionViewHeader.reuseID, for: indexPath) as? LearnNewWordzCollectionViewHeader else { return UICollectionReusableView() }
        header.configure()
        return header
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        UIApplication.hapticSoft()
        let item = viewModel.items[indexPath.row]
        let module = goJourney(.thematicWordz(typeWord: ArkenstoneTypeWord(rawValue: item.title) ?? .unknown,
                                              typeTranslation: SilverTypeTranslation(rawValue: item.badgeText) ?? .unknown))
        
        module.modalPresentationStyle = .fullScreen
        self.present(module, animated: true, completion: nil)
    }
    
}
