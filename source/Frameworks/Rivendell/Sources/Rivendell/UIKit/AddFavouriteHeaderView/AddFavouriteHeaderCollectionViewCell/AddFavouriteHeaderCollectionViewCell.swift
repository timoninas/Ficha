//
//  AddFavouriteHeaderCollectionViewCell.swift
//  
//
//  Created by Антон Тимонин on 23/02/2022.
//

import UIKit
import Hobbiton

public final class AddFavouriteHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public static
    
    public static var reuseID: String { "\(String(describing: self))ID" }
    
    // MARK: - Private properties
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Input translate", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name:"HelveticaNeue-Medium", size: 12.0) ?? UIFont(),
            .kern: 0.25
        ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    // MARK: - Public methods
    
    public func configure(configuration: Configuration) {
        textField.placeholder = configuration.placeholderText
    }
    
    public func text() -> String? {
        textField.text
    }
    
    public func resetState() {
        textField.text = nil
    }
    
    public func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
    
}
