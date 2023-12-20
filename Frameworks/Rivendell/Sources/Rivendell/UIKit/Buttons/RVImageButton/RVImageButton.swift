//
//  RVImageButton.swift
//  
//
//  Created by Антон Тимонин on 07.11.2021.
//

import UIKit

public class RVImageButton: BaseControl {
    
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
    
    // MARK: - Public methods
    
    public func renderAsCloseButton(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            heightAnchor.constraint(equalToConstant: 30.0),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addContainerView()
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
        layer.cornerCurve = configuration.fullyRounded ? .circular : .continuous
        
        containerView.layer.cornerRadius = configuration.fullyRounded
        ? containerView.frame.height / 2
        : configuration.cornerRadius
        containerView.layer.cornerCurve = configuration.fullyRounded ? .circular : .continuous
    }
    
    func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        // Container View constraints
        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
        
        // Description Title constraints
        constraints.append(contentsOf: [
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: configuration.imageAspectRatio),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.deactivate(viewConstraints)
        viewConstraints = constraints
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    private func addContainerView() {
        addSubview(containerView)
        containerView.backgroundColor = configuration.backgroundColor
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
        configuration.onTap?(self)
        setHighlighted(isHighlighted: false, animated: true)
    }
    
    public override func setHighlighted(isHighlighted: Bool, animated: Bool) {
        super.setHighlighted(isHighlighted: isHighlighted, animated: animated)
        guard let _ = configuration.onTap else { return }
        if isHighlighted {
            UIView.animate(withDuration: 0.045) {
                self.transform = self.transform.scaledBy(x: 0.95, y: 0.95)
                self.isUserInteractionEnabled = false
                self.imageView.tintColor = self.configuration.imageColor?.withAlphaComponent(0.75)
            }
        } else {
            UIView.animate(withDuration: 0.045) {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.isUserInteractionEnabled = true
                self.imageView.tintColor = self.configuration.imageColor
            }
        }
    }
}
