//
//  SettingCellView.swift
//  
//
//  Created by Антон Тимонин on 04.01.2022.
//

import UIKit

public final class SettingCellView: UIView {
    
    // MARK: - Init
    
    private struct Constants {
        static var topBottomOffset: CGFloat { 2.0 }
        static var leftRightOffset: CGFloat { 16.0 }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private var contentView = UIView()
    
    private var separatorView = UIView()
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue)
        }
    }
    
    private var storedConstraints: [NSLayoutConstraint] = []
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addContentView()
        addTitle()
        addSeparatorView()
        
        updateAppearance()
    }
    
    private func addContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
    }
    
    private func addTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    private func addSeparatorView() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .urukhigh.withAlphaComponent(0.5)
        addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.75)
        ])
    }
    
    private func updateAppearance() {
        updateContent()
        updateVisability()
        setupConstraints()
    }
    
    private func updateContent() {
        switch configuration.state {
        case .onlyTitle(title: let text):
            titleLabel.text = text
        }
    }
    
    private func updateVisability() {
        switch configuration.state {
        case .onlyTitle:
            titleLabel.isHidden = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        switch configuration.state {
        case .onlyTitle:
            setupConstraintsForOnlyTitleState()
        }
        
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func setupConstraintsForOnlyTitleState() {
        
        storedConstraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        storedConstraints += [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topBottomOffset),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.leftRightOffset),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.leftRightOffset),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.topBottomOffset),
        ]
        
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        updateAppearance()
    }
    
    /// Вычисляет высоту для элемента `SettingCellView`.
    /// - Parameter configuration: Конфигурация объекта.
    /// - Returns: Высота.
    public static func height(configuration: Configuration) -> CGFloat {
        
        switch configuration.state {
        case .onlyTitle(title: let text):
            return Constants.topBottomOffset * 2
            + 20.0
            + text.heightForOneLine(
                font: UIFont(
                    name:"HelveticaNeue-Bold",
                    size: 14.0
                )
            )
        }
        
    }
    
}
