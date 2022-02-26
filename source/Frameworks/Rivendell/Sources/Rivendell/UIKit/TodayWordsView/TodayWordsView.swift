//
//  TodayWordsView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Hobbiton

public protocol UIViewWithHeight {
    
    func height() -> CGFloat
    
}

public final class TodayWordsView: UIView, UIViewWithHeight {
    
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
            configurationChanged(oldValue)
        }
    }
    
    private var storedConstraints = [NSLayoutConstraint]()
    
    private var hasSecond: Bool {
        guard let subtitles = configuration.subtitles else { return false }
        return !subtitles.isEmpty
    }
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20.0
        blurView.layer.cornerRadius = 20.0
        updateContent()
    }
    
    private func configurationChanged(_ oldValue: Configuration) {
        updateAppearance()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addBlurView()
        addContentView()
        addMainLabel()
        addSecondLabel()
        
        updateAppearance()
    }
    
    private func addBlurView() {
        insertSubview(blurView, at: 0)
    }
    
    private func addContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
    }
    
    private func addMainLabel() {
        contentView.addSubview(mainLabel)
    }
    
    private func addSecondLabel() {
        contentView.addSubview(secondLabel)
    }
    
    private func updateAppearance() {
        setupConstraints()
        updateContent()
        secondLabel.addInterlineSpacing(spacingValue: 5.0)
        layer.cornerRadius = 20.0
        blurView.layer.cornerRadius = 20.0
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(storedConstraints)
        storedConstraints.removeAll()
        
        storedConstraints += [
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.rightAnchor.constraint(equalTo: rightAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurView.leftAnchor.constraint(equalTo: leftAnchor)
        ]
        
        storedConstraints += [
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 14.0),
            contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.0),
            contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
        ]
        
        storedConstraints += [
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0),
            mainLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0.0),
            mainLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0.0)
        ]
        if hasSecond { } else {
            storedConstraints += [
                mainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0),
            ]
        }
        
        if hasSecond {
            storedConstraints += [
                secondLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 14.0),
                secondLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                secondLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            ]
        }
        NSLayoutConstraint.activate(storedConstraints)
    }
    
    private func updateContent() {
        mainLabel.text = configuration.title
        if let subtitles = configuration.subtitles {
            secondLabel.text = subtitles.joined(separator: "\n\n")
        }
    }
    
    var mainLabelHeightAnchor: [NSLayoutConstraint] = []
    
    public func height() -> CGFloat {
        NSLayoutConstraint.deactivate(mainLabelHeightAnchor)
        mainLabelHeightAnchor.removeAll()
        var totalHeight: CGFloat = 0.0
        
        let mainLabelHeight = mainLabel.numberOfVisibleLines * mainLabel.font.lineHeight
        mainLabelHeightAnchor += [ mainLabel.heightAnchor.constraint(equalToConstant: mainLabelHeight) ]
        totalHeight += mainLabelHeight
        
        if hasSecond {
            let secondLabelHeight = secondLabel.numberOfVisibleLines * secondLabel.font.lineHeight
            mainLabelHeightAnchor += [ secondLabel.heightAnchor.constraint(equalToConstant: secondLabelHeight) ]
            totalHeight += secondLabelHeight
        } else {
            totalHeight += 20
        }
        
        totalHeight += 35
        
        NSLayoutConstraint.activate(mainLabelHeightAnchor)
        
        return totalHeight
    }
    
}
