//
//  File.swift
//  
//
//  Created by Антон Тимонин on 07.11.2021.
//

import UIKit

public class RVImageButton: RVControl {
    
    
    // MARK: - Private properties
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(oldValue: oldValue)
        }
    }
    
    private var viewConstraints = [NSLayoutConstraint]()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        view.layer.masksToBounds = false
        view.layer.shadowColor = #colorLiteral(red: 0.4999483824, green: 0.50003618, blue: 0.4999368191, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 2
        
        return view
    }()
    
    private var imageView: UIImageView = UIImageView()
    
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
        addContentView()
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
        layer.cornerRadius = configuration.fullyRounded
        ? frame.height / 2
        : configuration.cornerRadius
        
        containerView.layer.cornerRadius = configuration.fullyRounded
        ? containerView.frame.height / 2
        : configuration.cornerRadius
    }
    
    func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        // Container View constraints
        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor),
        ])
        
        // Description Title constraints
        constraints.append(contentsOf: [
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: configuration.imageAspectRatio),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.deactivate(self.viewConstraints)
        self.viewConstraints = constraints
        NSLayoutConstraint.activate(self.viewConstraints)
    }
    
    private func addContentView() {
        self.addSubview(containerView)
        self.containerView.backgroundColor = self.configuration.backgroundColor
    }
    
    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
    }
    
    private func updateContent() {
        backgroundColor = .clear
        containerView.backgroundColor = configuration.backgroundColor
        imageView.image = configuration.image?.withRenderingMode(.alwaysTemplate)
        if let color = configuration.imageColor {
            imageView.tintColor = color
        }
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
            self.containerView.backgroundColor = isHighlighted
            ? self.configuration.highlitedColor
            : self.configuration.backgroundColor
        }
    }
}
