//
//  File.swift
//  
//
//  Created by Антон Тимонин on 07.11.2021.
//

import Foundation

class RVButton: RVControl {
    
    // MARK:- Private properties
    private struct Constants {
        static let defaultColor: UIColor = UIColor(red: 94, green: 107, blue: 250, alpha: 1)
    }
    
    private var viewConstraints = [NSLayoutConstraint]()
    
    private var backColor: UIColor
    private var highColor: UIColor
    private var cornerRadiusView: CGFloat = 0
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
    
    private var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        label.textColor = #colorLiteral(red: 0.8286433816, green: 0.8227248788, blue: 0.8331763148, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private var hasDetail: Bool {
        get { return self.descriptionTitle.text == nil || self.descriptionTitle.text == "" ? false: true }
    }
    
    // MARK:- Public properties
    public var color: UIColor {
        get { return self.backColor }
        set {
            guard self.backColor != newValue else { return }
            self.backColor = newValue
        }
    }
    
    public var highlightedColor: UIColor {
        get { return self.highColor }
        set {
            guard self.highColor != newValue else { return }
            self.highColor = newValue
        }
    }
    
    public var title: String? {
        get { return self.mainTitle.text }
        set {
            guard let newTitle = newValue,
                  newTitle != self.mainTitle.text else { return }
            self.mainTitle.text = newTitle
            self.updateConstraints()
        }
    }
    
    public var titleDescription: String? {
        get { return self.descriptionTitle.text }
        set {
            guard let newTitle = newValue,
                  newTitle != self.descriptionTitle.text else { return }
            self.descriptionTitle.text = newTitle
            self.updateConstraints()
        }
    }
    
    public var titleColor: UIColor {
        get { return self.mainTitle.textColor }
        set {
            guard self.mainTitle.textColor != newValue else { return }
            self.mainTitle.textColor = newValue
        }
    }
    
    public var titleDescriptionColor: UIColor {
        get { return self.descriptionTitle.textColor }
        set {
            guard self.descriptionTitle.textColor != newValue else { return }
            self.descriptionTitle.textColor = newValue
        }
    }
    
    public var cornerRadius: CGFloat {
        get { return self.cornerRadiusView }
        set {
            guard self.containerView.layer.cornerRadius != newValue else { return }
            self.containerView.layer.cornerRadius = newValue
        }
    }
    
    public init(color: UIColor? = nil,
                highlightedColor: UIColor? = nil,
                title: String? = "Click",
                description: String? = nil,
                titleFontSize: CGFloat? = 20,
                descriptionTitleFontSize: CGFloat? = 14,
                handler: ((_ button: RVButton) -> Void)? = nil) {
        self.backColor = color ?? Constants.defaultColor
        self.highColor = highlightedColor ?? color ?? Constants.defaultColor
        self.mainTitle.text = title
        self.descriptionTitle.text = description
        self.mainTitle.font = UIFont(name:"HelveticaNeue-Bold", size: titleFontSize ?? 20)
        self.descriptionTitle.font = UIFont(name:"HelveticaNeue-Bold", size: descriptionTitleFontSize ?? 14)
        self.onTap = handler
        super.init()
        self.setupUI()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addView()
        addTitle()
        addDescriptionTitle()
        updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        var constraints = [NSLayoutConstraint]()
        
        // Container View constraints
        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
        ])
        
        // Main Title constraints
        if self.hasDetail {
            constraints.append(contentsOf: [
                mainTitle.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor, constant: -10),
            ])
        } else {
            constraints.append(contentsOf: [
                mainTitle.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor, constant: 0),
            ])
        }
        constraints.append(contentsOf: [
            mainTitle.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -4),
            mainTitle.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 4)
        ])
        
        // Description Title constraints
        constraints.append(contentsOf: [
            descriptionTitle.topAnchor.constraint(equalTo: self.mainTitle.bottomAnchor, constant: 4),
            descriptionTitle.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor, constant: 0),
            descriptionTitle.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: 6),
            descriptionTitle.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.deactivate(self.viewConstraints)
        self.viewConstraints = constraints
        NSLayoutConstraint.activate(self.viewConstraints)
    }
    
    private func addView() {
        self.addSubview(containerView)
        self.containerView.backgroundColor = self.backColor
    }
    
    private func addTitle() {
        self.addSubview(mainTitle)
    }

    private func addDescriptionTitle() {
        self.addSubview(descriptionTitle)
    }
    
    override public func handleTap() {
        self.onTap?(self)
        self.setHighlighted(isHighlighted: false, animated: true)
    }
    
    public var onTap: ((_ button: RVButton) -> Void)?
    
    override func setHighlighted(isHighlighted: Bool, animated: Bool) {
        updateColorState(isHighlighted)
    }
    
    private func updateColorState(_ isHighlighted: Bool) {
        UIView.animate(withDuration: 0.1) {
            self.containerView.backgroundColor = isHighlighted ? self.highColor: self.backColor
        }
    }
}
