//
//  AddFavouriteHeaderViewHeaderCell.swift
//  
//
//  Created by Антон Тимонин on 24/02/2022.
//

import UIKit

public final class AddFavouriteHeaderViewHeaderCell: UITableViewHeaderFooterView {
    
    // MARK: - Public static
    
    public static var reuseID: String { "\(String(describing: self))ID" }
    
    public var isVisible: Bool {
        header.isVisible
    }
    
    // MARK: - Private properties
    
    private var header = AddFavouriteHeaderView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(configuration: AddFavouriteHeaderView.Configuration) {
        header.configuration = configuration
    }
    
    public func resetState() {
        header.resetState()
    }
    
    public func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        header.setTextFieldDelegate(delegate: delegate)
    }
    
    private func configureUI() {
        header.translatesAutoresizingMaskIntoConstraints = false
        addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.rightAnchor.constraint(equalTo: rightAnchor),
            header.bottomAnchor.constraint(equalTo: bottomAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
}
