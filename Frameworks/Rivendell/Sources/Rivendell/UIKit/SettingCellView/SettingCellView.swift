//
//  SettingCellView.swift
//  
//
//  Created by Антон Тимонин on 04.01.2022.
//

import UIKit
import Hobbiton

public final class SettingCellView: UIView {
    
    // MARK: - Init
    
    private struct Constants {
        static var topBottomOffset: CGFloat { 2.0 }
        static var leftRightOffset: CGFloat { 16.0 }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .urukhigh
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    private var switchClosure: GenericClosure<Bool>?
    
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
        addSwitcher()
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
    
    private func addSwitcher() {
        switcher.addTarget(self, action: #selector(onSwitchValueChanged(_:)), for: .valueChanged)
        contentView.addSubview(switcher)
    }
    
    @objc func onSwitchValueChanged(_ someSwitch: UISwitch) {
        switchClosure?(someSwitch.isOn)
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
        case .switcher(title: let text, let state, closure: let closure):
            titleLabel.text = text
            switcher.setOn(state, animated: false)
            switchClosure = closure
        }
    }
    
    private func updateVisability() {
        switch configuration.state {
        case .onlyTitle:
            titleLabel.isHidden = false
            switcher.isHidden = true
        case .switcher:
            titleLabel.isHidden = false
            switcher.isHidden = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        switch configuration.state {
        case .onlyTitle:
            setupConstraintsForOnlyTitleState()
        case .switcher:
            setupConstraintsForOnlySwitcherState()
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
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.leftRightOffset),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.topBottomOffset),
        ]
        
    }
    
    private func setupConstraintsForOnlySwitcherState() {
        
        storedConstraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        storedConstraints += [
            switcher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topBottomOffset),
            switcher.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.leftRightOffset),
            switcher.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.topBottomOffset),
        ]
        
        storedConstraints += [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topBottomOffset),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.leftRightOffset),
            titleLabel.rightAnchor.constraint(equalTo: switcher.leftAnchor, constant: -Constants.leftRightOffset),
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
        case .onlyTitle(title: let text),
             .switcher(title: let text, initialState: _, closure: _):
            return Constants.topBottomOffset * 2
            + 20.0
            + text.heightForOneLine(
                font: UIFont(
                    name:"HelveticaNeue-Bold",
                    size: 16.0
                )
            )
        }
        
    }
    
}
