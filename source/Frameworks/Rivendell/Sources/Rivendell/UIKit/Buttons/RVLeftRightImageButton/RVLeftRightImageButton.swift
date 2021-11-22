//
//  File.swift
//  
//
//  Created by Антон Тимонин on 16.11.2021.
//

import UIKit

public class RVLeftRightImageButton: RVControl {
    
    // MARK: - Private properties
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }
    
    private var viewConstraints = [NSLayoutConstraint]()
    
    private var imageContainerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private var textContainerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init()
        configureUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateRounding()
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addImageContainerView()
        addTextContainerView()
        addImageView()
        updateAppearance()
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
    private func updateAppearance() {
        updateRounding()
        updateContent()
        setupConstraints()
    }
    
    private func updateRounding() {
//        layer.cornerRadius = configuration.fullyRounded
//        ? frame.height / 2
//        : configuration.cornerRadius
//
//        containerView.layer.cornerRadius = configuration.fullyRounded
//        ? containerView.frame.height / 2
//        : configuration.cornerRadius
    }
    
    func setupConstraints() {
        
        let constraints = [NSLayoutConstraint]()
        
        NSLayoutConstraint.deactivate(self.viewConstraints)
        self.viewConstraints = constraints
        NSLayoutConstraint.activate(self.viewConstraints)
    }
    
    private func addImageContainerView() {
        addSubview(imageContainerView)
        imageContainerView.backgroundColor = .clear
    }
    
    private func addTextContainerView() {
        addSubview(textContainerView)
        textContainerView.backgroundColor = .clear
    }
    
    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
    }
    
    private func updateContent() {
//        backgroundColor = .clear
//        containerView.backgroundColor = configuration.backgroundColor
//        imageView.image = configuration.image?.withRenderingMode(.alwaysTemplate)
//        if let color = configuration.imageColor {
//            imageView.tintColor = color
//        }
    }
    
    override public func handleTap() {
        self.configuration.onTap?(self)
        self.setHighlighted(isHighlighted: false, animated: true)
    }
    
    public override func setHighlighted(isHighlighted: Bool, animated: Bool) {
        super.setHighlighted(isHighlighted: isHighlighted, animated: animated)
        updateColorState(isHighlighted)
    }
    
    private func updateColorState(_ isHighlighted: Bool) {
        UIView.animate(withDuration: 0.1) {
//            self.containerView.backgroundColor = isHighlighted
//            ? self.configuration.highlitedColor
//            : self.configuration.backgroundColor
        }
    }
}
