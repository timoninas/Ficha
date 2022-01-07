//
//  DailyWordsHeader.swift
//  CardzApp
//
//  Created by Антон Тимонин on 17.10.2021.
//

import UIKit
import Rivendell

/// DailyWordsHeader
///
/// Селфсайзится по высоте
final class DailyWordsHeader: UIView {
    
    // MARK: - Public properties
    
    public var onTap: (() -> Void)?
    
    public var title: String = "" {
        didSet {
            if title != oldValue {
                titleLabel.text = title
            }
        }
    }
    
    // MARK: - Private properties
    
    private struct Constants {
        static let height: CGFloat = 65.0
        static let settingsImageSize = 42.5
        static let revolvetraImageSize = 12.5
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let revolvetraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if var image = UIImage.revolvetra {
            imageView.image = image
        }
        return imageView
    }()
    
    private let settingsButton = RVImageButton(configuration: .init()
                                                .with(isFullyRounded: true)
                                                .with(backgroundColor: .clear)
                                                .with(highlitedColor: .clear)
                                               //                                                .with(image: .settingRoundIcon)
                                                .with(imageColor: .nazgul))
    
    private let settingsButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage.settingRoundIcon {
            button.setImage(image.withTintColor(.nazgul).withRenderingMode(.automatic), for: .normal)
        }
        return button
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configureUI() {
        setupView()
        addSettingsButton()
        addTitleLabel()
        addRevolvetraImageView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
    
    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.rightAnchor.constraint(lessThanOrEqualTo: settingsButton.leftAnchor, constant: -10.0).isActive = true
        titleLabel.sizeToFit()
    }
    
    private func addRevolvetraImageView() {
        addSubview(revolvetraImageView)
        revolvetraImageView.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 2.0).isActive = true
        revolvetraImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 8.0).isActive = true
        revolvetraImageView.heightAnchor.constraint(equalToConstant: Constants.revolvetraImageSize).isActive = true
        revolvetraImageView.widthAnchor.constraint(equalTo: revolvetraImageView.heightAnchor).isActive = true
    }
    
    private func addSettingsButton() {
        settingsButton.configuration = settingsButton.configuration
            .with(onTap: { [weak self] _ in
                guard let self = self else { return }
                self.onTap?()
                print("kek")
            })
        addSubview(settingsButton)
        settingsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: Constants.settingsImageSize).isActive = true
        settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor).isActive = true
        settingsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
    }
    
}
