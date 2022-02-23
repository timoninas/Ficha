//
//  HorizontalLineLayout.swift
//  CardzApp
//
//  Created by Антон Тимонин on 20/02/2022.
//

import UIKit

/// Horizontal align collection layout. Currently, 1 line aligning.
public final class HorizontalLineLayout: UICollectionViewLayout {
    
    // MARK: - Public properties
    
    public var configuration: Configuration
    
    // MARK: - Private properties
    
    private var cacheForAttributes: [UICollectionViewLayoutAttributes] = []
    
    private var totalCollectionWidth = 0.0
    
    // MARK: - Init
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden
    
    public override var collectionViewContentSize: CGSize {
        CGSize(width: totalCollectionWidth, height: configuration.heightForOneItem + configuration.topInset + configuration.bottomInset)
    }
    
    public override func prepare() {
        guard cacheForAttributes.isEmpty,
              let collectionView = collectionView else {
                  return
              }
        
        let yOffset: CGFloat = configuration.topInset
        var xOffset: CGFloat = configuration.initialSpacing
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let cellWidth = configuration.widthForOneItem
            let cellHeight = configuration.heightForOneItem
            
            let frame = CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight)
            
            xOffset += cellWidth + configuration.spacingBetweenCell
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cacheForAttributes.append(attributes)
            totalCollectionWidth = xOffset
        }
        
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attribute in cacheForAttributes {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cacheForAttributes[indexPath.item]
    }
    
    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                             withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            return latestOffset
        }
        
        // Page width used for estimating and calculating paging.
        let pageWidth = configuration.widthForOneItem + configuration.initialSpacing
        
        // Make an estimation of the current page position.
        let approximatePage = collectionView.contentOffset.x/pageWidth
        
        // Determine the current page based on velocity.
        let currentPage = velocity.x == 0 ? round(approximatePage) : (velocity.x < 0.0 ? floor(approximatePage) : ceil(approximatePage))
        
        // Create custom flickVelocity.
        let flickVelocity = velocity.x * 0.3
        
        // Check how many pages the user flicked, if <= 1 then flickedPages should return 0.
        let flickedPages = (abs(round(flickVelocity)) <= 1) ? 0 : round(flickVelocity)
        
        // Calculate newHorizontalOffset.
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - collectionView.contentInset.left
        
        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
    
}

