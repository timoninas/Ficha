//
//  AddFavouriteHeaderView.swift
//  
//
//  Created by Антон Тимонин on 23/02/2022.
//

import UIKit
import Hobbiton

public final class AddFavouriteHeaderView: UIView {
    
    // MARK: - Public properties
    
    public var configuration: Configuration {
        didSet {
            self.configurationChanged(old: oldValue)
        }
    }
    
    public var isVisible: Bool = true
    
    // MARK: - Private properties
    
    private struct Constants {
        static let sideOffset: CGFloat = 10.0
    }
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adding word to favourite"
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue-Medium", size: 14.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var wordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .nazgul
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .whisper
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Input word", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name:"HelveticaNeue-Medium", size: 12.0) ?? UIFont(),
            .kern: 0.25
        ])
        return textField
    }()
    
    private lazy var translatesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(AddFavouriteHeaderCollectionViewCell.self, forCellWithReuseIdentifier: AddFavouriteHeaderCollectionViewCell.reuseID)
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: false)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = self
        return collectionView
    }()
    
    private var collectionViewFlowLayout = HorizontalLineLayout(configuration: .init()
                                                                    .with(initialSpacing: 10.0)
                                                                    .with(spacingBetweenCell: 10.0)
                                                                    .with(heightForOneItem: 35.0)
                                                                    .with(widthForOneItem: 140.0))
    
    private var button: RVButton = {
        let button = RVButton(configuration: .init()
                                .with(title: "Add word")
                                .with(size: .elkoko)
                                .with(backgroundColor: .mysteryShack)
                                .with(highlitedColor: .mysteryShack.withAlphaComponent(0.8)))
        return button
    }()
    
    private var storedContraints: [NSLayoutConstraint] = []
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        backgroundColor = .gendalf
        translatesAutoresizingMaskIntoConstraints = false
        addContentView()
        addLabel()
        addTextField()
        addCollection()
        addButton()
        
        setupConstraints()
        
        updateAppearance()
    }
    
    private func translates() -> [String] {
        var translates: [String?] = []
        for row in 0..<self.translatesCollectionView.numberOfItems(inSection: 0) {
            let indexPath = NSIndexPath(row:row, section:0)
            if let cell = self.translatesCollectionView.cellForItem(at: indexPath as IndexPath) as? AddFavouriteHeaderCollectionViewCell {
                translates.append(cell.text())
            }
        }
        return translates
            .compactMap { $0 }
            .filter { !$0.isEmpty }
    }
    
    private func resetCollectionTextFields() {
        translatesCollectionView.setContentOffset(.zero, animated: false)
        for row in 0..<self.translatesCollectionView.numberOfItems(inSection: 0) {
            let indexPath = NSIndexPath(row:row, section:0)
            if let cell = self.translatesCollectionView.cellForItem(at: indexPath as IndexPath) as? AddFavouriteHeaderCollectionViewCell {
                cell.resetState()
            }
        }
    }
    
    private func addContentView() {
        addSubview(contentView)
    }
    
    private func addLabel() {
        contentView.addSubview(label)
    }
    
    private func addTextField() {
        contentView.addSubview(wordTextField)
    }
    
    private func addCollection() {
        contentView.addSubview(translatesCollectionView)
    }
    
    private func addButton() {
        contentView.addSubview(button)
        button.configuration = button.configuration
            .with(onTap: { [weak self] _ in
                guard let self = self else { return }
                var text: String?
                if let fieldText = self.wordTextField.text, !fieldText.isEmpty {
                    text = fieldText
                }
                self.configuration.onTap?(text, self.translates())
            })
    }
    
    private func updateAppearance() {
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedContraints)
        storedContraints.removeAll()
        
        storedContraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor)
        ]
        
        storedContraints += [
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.sideOffset),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.sideOffset),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.sideOffset),
            label.heightAnchor.constraint(equalToConstant: 20.0)
        ]
        
        storedContraints += [
            wordTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 6.0),
            wordTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.sideOffset),
            wordTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.sideOffset),
            wordTextField.heightAnchor.constraint(equalToConstant: 35.0)
        ]
        
        storedContraints += [
            translatesCollectionView.topAnchor.constraint(equalTo: wordTextField.bottomAnchor, constant: Constants.sideOffset),
            translatesCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            translatesCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            translatesCollectionView.heightAnchor.constraint(equalToConstant: 35.0)
        ]
        
        storedContraints += [
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.sideOffset),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sideOffset),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.sideOffset)
        ]
        
        NSLayoutConstraint.activate(storedContraints)
    }
    
    // MARK: - Public properties
    
    public static func height() -> CGFloat {
        var height: CGFloat = 0.0
        
        // Label
        height += 10.0 + 20.0
        
        // Word text field
        height += 6.0 + 35.0
        
        // Translates text field collection view
        height += 10.0 + 35.0
        
        // Button
        height += 10.0 + 30.0 + 10.0
        
        return height
    }
    
    public func resetState() {
        wordTextField.text = nil
        resetCollectionTextFields()
    }
    
    /// Hide header.
    /// - Parameter completion: Closure that react hiding showing header.
    public func hide(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.contentView.alpha = 0.0
            self.isVisible = false
        } completion: { _ in
            completion()
        }
    }
    
    /// Show header.
    /// - Parameter completion: Closure that react after showing header.
    public func show(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.contentView.alpha = 1.0
            self.isVisible = true
        } completion: { _ in
            completion()
        }
    }
    
    public func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        wordTextField.delegate = delegate
        addDelegatesToCells(delegate: delegate)
    }
    
    public func addDelegatesToCells(delegate: UITextFieldDelegate) {
        for row in 0..<self.translatesCollectionView.numberOfItems(inSection: 0) {
            let indexPath = NSIndexPath(row:row, section:0)
            if let cell = self.translatesCollectionView.cellForItem(at: indexPath as IndexPath) as? AddFavouriteHeaderCollectionViewCell {
                cell.setTextFieldDelegate(delegate: delegate)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func configurationChanged(old: Configuration) {
        
    }
    
}

extension AddFavouriteHeaderView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequedCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddFavouriteHeaderCollectionViewCell.reuseID, for: indexPath)
        guard let cell = dequedCell as? AddFavouriteHeaderCollectionViewCell else { return dequedCell }
        cell.configure(configuration: .init(placeholderText: "Input translate \(indexPath.row + 1)"))
        return cell
    }
    
}
