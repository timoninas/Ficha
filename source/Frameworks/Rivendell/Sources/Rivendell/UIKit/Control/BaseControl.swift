//
//  RControl.swift
//  button-control
//
//  Created by Антон Тимонин on 16.07.2021.
//

import UIKit

public class RVControl: UIControl {
    
    open var isHighlightedState = false
    
    public init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTouchHandling()
    }
    
    override open var isHighlighted: Bool {
        get { return self.isHighlightedState }
        set {
            guard newValue != self.isHighlightedState else {
                return
            }
            self.setHighlighted(isHighlighted: newValue, animated: true)
        }
    }
    
    open func setHighlighted(isHighlighted: Bool, animated: Bool) {
        self.isHighlightedState = isHighlighted
    }
    
    required public init?(coder: NSCoder) {
        fatalError("NSCoder RControl")
    }
    
    private func addTouchHandling() {
        self.addTarget(self, action: #selector(handleTouchUpInside), for: .touchUpInside)
    }
    
    @objc private func handleTouchUpInside() {
        self.handleTap()
    }
    
    @objc open func handleTap() { }

}
