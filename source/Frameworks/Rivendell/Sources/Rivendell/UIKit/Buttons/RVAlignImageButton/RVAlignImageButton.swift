//
//  RVAlignImageButton.swift
//  
//
//  Created by Антон Тимонин on 16.11.2021.
//

import UIKit

public class RVAlignImageButton: RVControl {
    
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
        
        return view
    }()
    
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
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
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
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addContainerView()
        addImageContainerView()
        addTextContainerView()
        addImageView()
        addTitle()
        updateAppearance()
    }
    
    private func configurationChanged(oldValue: Configuration) {
        updateAppearance()
    }
    
    private func updateAppearance() {
        updateContent()
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.deactivate(viewConstraints)
        viewConstraints.removeAll()
        
        viewConstraints += [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor)
        ]
        
        switch configuration.align {
        case .left:
            
            viewConstraints += [
                imageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                imageContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                imageContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageContainerView.widthAnchor.constraint(equalTo: imageContainerView.heightAnchor)
            ]
            
            viewConstraints += [
                textContainerView.leftAnchor.constraint(equalTo: imageContainerView.rightAnchor),
                textContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                textContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                textContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ]
            
        case .right:
            
            viewConstraints += [
                imageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                imageContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                imageContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageContainerView.widthAnchor.constraint(equalTo: imageContainerView.heightAnchor)
            ]
            
            viewConstraints += [
                textContainerView.rightAnchor.constraint(equalTo: imageContainerView.leftAnchor),
                textContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                textContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                textContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ]
            
        case .top:
            
            viewConstraints += [
                imageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                imageContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                imageContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                imageContainerView.heightAnchor.constraint(equalTo: containerView.widthAnchor)
            ]
            
            viewConstraints += [
                textContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                textContainerView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
                textContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                textContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ]
            
            
            
        case .bottom:
            
            viewConstraints += [
                imageContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                imageContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                imageContainerView.heightAnchor.constraint(equalTo: containerView.widthAnchor)
            ]
            
            viewConstraints += [
                textContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                textContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                textContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                textContainerView.bottomAnchor.constraint(equalTo: imageContainerView.topAnchor)
            ]
        }
        
        viewConstraints += [
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: configuration.imageMultiplier),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ]
        
        viewConstraints += [
            title.topAnchor.constraint(equalTo: textContainerView.topAnchor),
            title.leftAnchor.constraint(equalTo: textContainerView.leftAnchor),
            title.rightAnchor.constraint(equalTo: textContainerView.rightAnchor),
            title.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    private func addContainerView() {
        addSubview(containerView)
    }
    
    private func addTextContainerView() {
        addSubview(textContainerView)
    }
    
    private func addImageContainerView() {
        addSubview(imageContainerView)
    }
    
    private func addImageView() {
        imageContainerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addTitle() {
        textContainerView.addSubview(title)
    }
    
    private func updateContent() {
        if case let .visible(title: text, color: color) = configuration.titleConfig {
            title.text = text
            title.textColor = color
        }
        if case let .visible(image: image, color: color) = configuration.imageConfig {
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
        }
    }
    
    override public func handleTap() {
        configuration.onTap?(self)
        setHighlighted(isHighlighted: false, animated: true)
    }
    
    public override func setHighlighted(isHighlighted: Bool, animated: Bool) {
        super.setHighlighted(isHighlighted: isHighlighted, animated: animated)
        guard let _ = configuration.onTap else { return }
        if isHighlighted {
            UIView.animate(withDuration: 0.15) {
                self.transform = self.transform.scaledBy(x: 0.95, y: 0.95)
                self.isUserInteractionEnabled = false
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.isUserInteractionEnabled = true
            }
        }
    }
}
