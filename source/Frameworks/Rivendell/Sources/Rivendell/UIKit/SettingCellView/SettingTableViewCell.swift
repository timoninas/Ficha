//
//  SettingTableViewCell.swift
//  
//
//  Created by Антон Тимонин on 04.01.2022.
//

import UIKit

public final class SettingTableViewCell: UITableViewCell {
    
    public static var reuseID: String { "\(String(describing: self))ID" }

    let settingViewCell = SettingCellView(
        configuration: .init(
            state: .onlyTitle(title: "")
        )
    )

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
        }
    
    private func configureUI() {
        addSubview(settingViewCell)
        NSLayoutConstraint.activate([
            settingViewCell.topAnchor.constraint(equalTo: topAnchor),
            settingViewCell.leftAnchor.constraint(equalTo: leftAnchor),
            settingViewCell.rightAnchor.constraint(equalTo: rightAnchor),
            settingViewCell.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configure(configuration: SettingCellView.Configuration) {
        settingViewCell.configuration = configuration
    }

}
