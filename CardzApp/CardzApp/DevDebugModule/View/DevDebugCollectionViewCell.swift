//
//  DevDebugCollectionViewCell.swift
//  CardzApp
//
//  Created by Антон Тимонин on 12/02/2022.
//

import UIKit

final class DevDebugCollectionViewCell: UICollectionViewCell {
    
    public static var reuseID: String { "\(String(describing: self))ID" }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .green
    }
    
}
