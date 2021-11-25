//
//  TodayWordsView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Hobbiton

public final class TodayWordsView: UIView {
    
    // MARK: - Init
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        return blurView
    }()
    
    private let contentView = UIView()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mysteryShack
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 36.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .nazgul
        label.font = UIFont(name:"HelveticaNeue", size: 20.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var configuration: Configuration = .init() {
        didSet {
            self.configurationChanged(oldValue)
        }
    }
    
    private var storedConstraints = [NSLayoutConstraint]()
    
    private var hasSecond: Bool {
        guard let subtitles = self.configuration.subtitles else { return false }
        return !subtitles.isEmpty
    }
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(frame: .zero)
        self.configureUI()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20.0
        self.blurView.layer.cornerRadius = 20.0
        self.updateContent()
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        self.updateAppearance()
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addBlurView()
        self.addContentView()
        self.addMainLabel()
        self.addSecondLabel()
        
        self.updateAppearance()
    }
    
    private func addBlurView() {
        self.insertSubview(self.blurView, at: 0)
    }
    
    private func addContentView() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
    }
    
    private func addMainLabel() {
        self.contentView.addSubview(self.mainLabel)
    }
    
    private func addSecondLabel() {
        self.contentView.addSubview(self.secondLabel)
    }
    
    private func updateAppearance() {
        self.setupConstraints()
        self.updateContent()
        self.secondLabel.addInterlineSpacing(spacingValue: 5.0)
        self.layer.cornerRadius = 20.0
        self.blurView.layer.cornerRadius = 20.0
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(self.storedConstraints)
        self.storedConstraints.removeAll()
        
        self.storedConstraints += [
            self.blurView.topAnchor.constraint(equalTo: self.topAnchor),
            self.blurView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.blurView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ]
        
        self.storedConstraints += [
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14.0),
            self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14.0),
            self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
        ]
        
        self.storedConstraints += [
            self.mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            self.mainLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0.0),
            self.mainLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0.0)
        ]
        if self.hasSecond {
//            self.storedConstraints += [
//                self.mainLabel.heightAnchor.constraint(equalToConstant: self.configuration.title.height(constraintedWidth: self.mainLabel.frame.width, font: self.mainLabel.font))
//            ]
        } else {
            self.storedConstraints += [
                self.mainLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0),
            ]
        }
        
        if self.hasSecond {
//            self.secondLabel.sizeToFit()
            self.storedConstraints += [
                self.secondLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 14.0),
                self.secondLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
                self.secondLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//                self.secondLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15.0)
//                self.secondLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -8.0),
//                self.secondLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0)
            ]
//            self.secondLabel.sizeToFit()
        }
        NSLayoutConstraint.activate(self.storedConstraints)
    }
    
    private func updateContent() {
        self.mainLabel.text = self.configuration.title
        if let subtitles = self.configuration.subtitles {
            self.secondLabel.text = subtitles.joined(separator: "\n\n")
        }
    }
    
    var mainLabelHeightAnchor: [NSLayoutConstraint] = []
    
    public func height() -> CGFloat {
        NSLayoutConstraint.deactivate(self.mainLabelHeightAnchor)
        self.mainLabelHeightAnchor.removeAll()
        var totalHeight: CGFloat = 0.0
        
        let mainLabelHeight = self.mainLabel.numberOfVisibleLines * self.mainLabel.font.lineHeight
        self.mainLabelHeightAnchor += [ self.mainLabel.heightAnchor.constraint(equalToConstant: mainLabelHeight) ]
        totalHeight += mainLabelHeight
        
        if self.hasSecond {
            let secondLabelHeight = self.secondLabel.numberOfVisibleLines * self.secondLabel.font.lineHeight
            self.mainLabelHeightAnchor += [ self.secondLabel.heightAnchor.constraint(equalToConstant: secondLabelHeight) ]
            totalHeight += secondLabelHeight
        } else {
            totalHeight += 20
        }
        
        totalHeight += 35
        
        NSLayoutConstraint.activate(self.mainLabelHeightAnchor)
        
        return totalHeight
    }
}
