//
//  HorizontalLineLayout.swift
//  CardzApp
//
//  Created by Антон Тимонин on 20/02/2022.
//

import UIKit

class HorizontalLineLayout: UICollectionViewLayout {
    
    var topInset: CGFloat = 15.0
    var bottomInset: CGFloat = 15.0
    var initialSpacing: CGFloat = 15.0
    var spacingBetweenCell: CGFloat = 10.0
    var heightForOneItem: CGFloat = 70.0
    var widthForOneItem: CGFloat = 70.0
    
    private var cacheForAttributes: [UICollectionViewLayoutAttributes] = []
    
    private var totalCollectionWidth = 0.0
    
    override var collectionViewContentSize: CGSize {
        CGSize(width: totalCollectionWidth, height: heightForOneItem + topInset + bottomInset)
    }
    
    override func prepare() {
        guard cacheForAttributes.isEmpty,
              let collectionView = collectionView else {
                  return
              }
        
        let yOffset: CGFloat = topInset
        var xOffset: CGFloat = initialSpacing
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let cellWidth = widthForOneItem
            let cellHeight = heightForOneItem
            
            let frame = CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight)
            print("x: \(xOffset), y: \(yOffset)")
            
            xOffset += cellWidth + spacingBetweenCell
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cacheForAttributes.append(attributes)
            totalCollectionWidth = xOffset
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attribute in cacheForAttributes {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cacheForAttributes[indexPath.item]
    }
    
}

