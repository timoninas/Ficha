//
//  TodayWordsView.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit

final class TodayWordsView: UIView {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
