//
//  DevViewController.swift
//  CardzApp
//
//  Created by Антон Тимонин on 07.01.2022.
//

import AVFoundation
import Rivendell
import Hobbiton
import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
    
    public static var reuseID: String { "\(String(describing: self))ID" }
    
    private(set) var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        clipsToBounds = true
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PreviewCollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        guard let imageSize = imageView.image?.size else { return }
//        let imageRect = AVMakeRect(aspectRatio: imageSize, insideRect: bounds)
//        let path = UIBezierPath(rect: imageRect)
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        layer.mask = shapeLayer
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let attrs = layoutAttributes as? ParallaxLayoutAttributes else {
            return super.apply(layoutAttributes)
        }
        let parallaxValue = attrs.parallaxValue ?? 0
        let transition = -(bounds.width * 0.3 * parallaxValue)
        imageView.transform = CGAffineTransform(translationX: transition, y: .zero)
    }
    
}

class ParallaxLayoutAttributes: UICollectionViewLayoutAttributes {
    var parallaxValue: CGFloat?
    
    override func copy() -> Any {
        let copy = ParallaxLayoutAttributes(forCellWith: indexPath)
        copy.indexPath = indexPath
        copy.transform = transform
        copy.center = center
        copy.alpha = alpha
        copy.zIndex = zIndex
        copy.isHidden = isHidden
        copy.bounds = bounds
        copy.transform3D = transform3D
        copy.frame = self.frame
        copy.size = size
        copy.parallaxValue = parallaxValue
        return copy
    }
}

class PreviewLayout: UICollectionViewLayout {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var cacheForAttributes: [ParallaxLayoutAttributes] = []
    
    private var totalCollectionWidth = 0.0
    
    private var cellHeight: CGFloat = 400.0
    
    var parallaxOffset: CGFloat = -24.0
    
    // MARK: - Init
    
    public override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden
    
    public override var collectionViewContentSize: CGSize {
        CGSize(width: totalCollectionWidth, height: cellHeight)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    
    override class var layoutAttributesClass: AnyClass {
        ParallaxLayoutAttributes.self
    }
    
    public override func prepare() {
        guard
            cacheForAttributes.isEmpty,
              let collectionView = collectionView
        else {
            return
        }
        
        cacheForAttributes.removeAll()
        
        let yOffset: CGFloat = 0.0
        var xOffset: CGFloat = 0.0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let cellWidth = self.collectionView?.frame.width ?? 0.0
            let cellHeight = cellHeight
            
            let frame = CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight)
            
            xOffset += cellWidth
            
            let attributes = ParallaxLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cacheForAttributes.append(attributes)
            totalCollectionWidth = xOffset
        }
        
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [ParallaxLayoutAttributes] = []
        
        for attribute in cacheForAttributes {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
            .compactMap { $0.copy() as? ParallaxLayoutAttributes }
            .compactMap { prepareAttributes(attributes: $0) }
    }
    
    private func prepareAttributes(attributes: ParallaxLayoutAttributes) -> ParallaxLayoutAttributes {
        guard let collectionView = self.collectionView else { return attributes }
        let width = collectionView.frame.width
        let centerX = width / 2
        let distanceToCenter = attributes.center.x - collectionView.contentOffset.x
        let relativeDistanceToCenter = (distanceToCenter - centerX) / width
        
        if abs(relativeDistanceToCenter) >= 1 {
            attributes.parallaxValue = nil
            attributes.transform = .identity
        } else {
            attributes.parallaxValue = relativeDistanceToCenter
            attributes.transform = CGAffineTransform(translationX: relativeDistanceToCenter * parallaxOffset, y: 0)
            if relativeDistanceToCenter * parallaxOffset <= 1.0 {
                attributes.zIndex = 1
            } else {
                attributes.zIndex = -1
            }
        }
        
        return attributes
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let parallaxAttribute = self.cacheForAttributes[indexPath.item]
        return self.prepareAttributes(attributes: parallaxAttribute)
    }
}

final class DevDebugViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: PreviewLayout())
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var previewLayout = PreviewLayout()
    
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
        collectionView.setNeedsLayout()
        collectionView.layoutIfNeeded()
        collectionView.reloadData()
    }
    
    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PreviewCollectionViewCell.self, forCellWithReuseIdentifier: PreviewCollectionViewCell.reuseID)
        collectionView.setCollectionViewLayout(previewLayout, animated: false)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension DevDebugViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionViewCell.reuseID, for: indexPath)
        guard let cell = dequedCell as? PreviewCollectionViewCell else { return dequedCell }
//        if indexPath.item % 3 == 0 {
//            cell.backgroundColor = .green
//        } else if indexPath.item % 3 == 1 {
//            cell.backgroundColor = .blue
//        } else if indexPath.item % 3 == 2 {
//            cell.backgroundColor = .yellow
//        }
        
        cell.imageView.image = UIImage.imageFromBundle(named: "\(indexPath.item)")
        
        return cell
    }
    
}
