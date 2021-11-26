//
//  FavouriteWordzBuilder.swift
//  CardzApp
//
//  Created by Антон Тимонин on 01.12.2021.
//

import UIKit

final class FavouriteWordzBuilder {
    
    static func build() -> FavouriteWordzViewController {
        let presenter = FavouriteWordzPresenter()
        let view = FavouriteWordzViewController(output: presenter)
        presenter.view = view
        return view
    }
    
}
