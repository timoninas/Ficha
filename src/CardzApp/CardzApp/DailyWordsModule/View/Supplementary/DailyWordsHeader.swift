//
//  DailyWordsHeader.swift
//  CardzApp
//
//  Created by Антон Тимонин on 17.10.2021.
//

import UIKit

/// DailyWordsHeader
///
/// Селфсайзится по высоте
final class DailyWordsHeader: UIView {
    
    // MARK: - Public properties
    
    public var onTap: (() -> Void)?
    
    public var title: String = "" {
        didSet {
            if self.title != oldValue {
                self.titleLabel.text = self.title
            }
        }
    }
    
    // MARK: - Private properties
    
    private struct Constants {
        static let height: CGFloat = 65.0
        static let settingsImageSize = 40.0
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
    
    private let settingsButton: UIButton = {
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
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configureUI() {
        self.setupView()
        self.addSettingsButton()
        self.addTitleLabel()
        self.addRevolvetraImageView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
    
    private func addTitleLabel() {
        self.addSubview(self.titleLabel)
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleLabel.rightAnchor.constraint(lessThanOrEqualTo: self.settingsButton.leftAnchor, constant: -10.0).isActive = true
        self.titleLabel.sizeToFit()
    }
    
    private func addRevolvetraImageView() {
        self.addSubview(self.revolvetraImageView)
        self.revolvetraImageView.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 2.0).isActive = true
        self.revolvetraImageView.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: 8.0).isActive = true
        self.revolvetraImageView.heightAnchor.constraint(equalToConstant: Constants.revolvetraImageSize).isActive = true
        self.revolvetraImageView.widthAnchor.constraint(equalTo: self.revolvetraImageView.heightAnchor).isActive = true
    }
    
    private func addSettingsButton() {
        self.addSubview(self.settingsButton)
        self.settingsButton.addTarget(self, action: #selector(onSettingsButtonTapped(sender:)), for: .touchUpInside)
        self.settingsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.settingsButton.heightAnchor.constraint(equalToConstant: Constants.settingsImageSize).isActive = true
        self.settingsButton.widthAnchor.constraint(equalTo: self.settingsButton.heightAnchor).isActive = true
        self.settingsButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
    }
    
    // MARK: - Private properties
    
    @objc
    func onSettingsButtonTapped(sender: UIButton) {
        guard let onTap = self.onTap else { return }
        onTap()
    }
    
}
