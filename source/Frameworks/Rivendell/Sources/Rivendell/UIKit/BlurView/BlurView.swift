//
//  BlurView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 11.10.2021.
//

import UIKit

public final class BlurView: UIView {
    
    public var configuration: Configuration {
        didSet {
            configurationChanged(old: oldValue)
        }
    }
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(configuration: Configuration = .init()) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emptyImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addBackgroundView()
    }
    
    private func addBackgroundView() {
        addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    private func configurationChanged(old: Configuration) {
    }
    
}
