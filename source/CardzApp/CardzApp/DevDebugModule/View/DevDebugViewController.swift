//
//  DevViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.01.2022.
//

import UIKit
import Rivendell
import Hobbiton

final class DevDebugViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        RLogDebug(message: "viewDidLoad", subsystem: String(describing: self))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    let interItemSpacing: CGFloat = 10.0
    let lineSpacing: CGFloat = 10.0
    
    private func configureUI() {
        view.backgroundColor = .gendalf
        addCollectionView()
        updateCollectionItemSize()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCollectionItemSize()
    }
    
    private var collectionViewFlowLayout = HorizontalLineLayout()
    
    private func addCollectionView() {
//        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
//        collectionViewFlowLayout.scrollDirection = .vertical
//        collectionViewFlowLayout.minimumLineSpacing = lineSpacing
//        collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DevDebugCollectionViewCell.self, forCellWithReuseIdentifier: DevDebugCollectionViewCell.reuseID)
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: false)
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.isPagingEnabled = true
//        collectionView.alwaysBounceVertical = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: self.collectionViewFlowLayout.collectionViewContentSize.height)
        ])
    }
    
    private func updateCollectionItemSize() {
//        let numberOfItemRow: CGFloat = 3
//        let width = (collectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
//        let height = width
//        guard width > 0 && height > 0 else { return }
//        collectionViewFlowLayout.itemSize = .init(width: 100, height: 100)
    }
    
}

extension DevDebugViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(withReuseIdentifier: DevDebugCollectionViewCell.reuseID, for: indexPath)
        guard let cell = dequedCell as? DevDebugCollectionViewCell else { return dequedCell }
        return cell
    }
    
}
