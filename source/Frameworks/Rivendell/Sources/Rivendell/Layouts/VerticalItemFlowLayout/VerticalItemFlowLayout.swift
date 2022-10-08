//
//  CustomLayout.swift
//  CardzApp
//
//  Created by Антон Тимонин on 12/02/2022.
//

import UIKit

class VerticalItemFlowLayout: UICollectionViewLayout {
    
    var numberOfColumns: CGFloat = 3
    var spacingBetweenCell: CGFloat = 10.0
    var spacingBetweenLines: CGFloat = 10.0
    var heightForOneItem: CGFloat = 70.0
    
    private var cacheForAttributes: [UICollectionViewLayoutAttributes] = []
    private var totalCollectionHeight: CGFloat = 0.0
    
    private var totalCollectionWidth: CGFloat {
        guard let collectionView else {
            return 0.0
        }
        
        return collectionView.bounds.width
    }
    
    override var collectionViewContentSize: CGSize {
        CGSize(width: totalCollectionWidth, height: totalCollectionHeight)
    }
    
    override func prepare() {
        guard cacheForAttributes.isEmpty,
              numberOfColumns > 0,
              let collectionView = collectionView else {
                  return
              }
        
        let columnWidth = (totalCollectionWidth - (numberOfColumns - 1) * spacingBetweenCell) / numberOfColumns
        
        var yOffset: CGFloat = 0.0
        var xOffset: CGFloat = 0.0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let cellWidth = columnWidth
            let cellHeight = heightForOneItem
            
            if xOffset + cellWidth <= totalCollectionWidth  {
                
            } else {
                xOffset = 0.0
                yOffset += cellHeight + spacingBetweenLines
            }
            
            let frame = CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight)
            
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cacheForAttributes.append(attributes)
            totalCollectionHeight = max(totalCollectionHeight, frame.maxY + spacingBetweenLines)
            
            
            xOffset += (cellWidth + spacingBetweenCell)
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
