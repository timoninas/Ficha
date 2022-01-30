//
//  AppConfigurator.swift
//  CardzApp
//
//  Created by Антон Тимонин on 12.01.2022.
//

import UIKit

protocol AppConfiguratorProtocol {
    
}

final class AppConfigurator {
    
    enum TabBarModule {
        case daily
        case learn
        case favourite
        case devDebug
        
        func buildModule() -> UIViewController {
            switch self {
            case .daily:
                let todayViewController = goJourney(.dailyWords)
                if let todayIconData = UIImage.todayIcon?.pngData(),
                   let todayIconFilledData = UIImage.todayIconFilled?.pngData() {
                    let image = UIImage(data: todayIconData, scale: 13.0)
                    let imageFilled = UIImage(data: todayIconFilledData, scale: 13.0)
                    let item = UITabBarItem(title: "Daily", image: image, selectedImage: imageFilled)
                    todayViewController.tabBarItem = item
                }
                return todayViewController
            case .learn:
                let learnViewController = goJourney(.learnNewWordz)
                if let graduateIconData = UIImage.graduateIcon?.pngData() ,
                   let graduateIconFilledData = UIImage.graduateIconFilled?.pngData() {
                    let image = UIImage(data: graduateIconData, scale: 13.0)
                    let imageFilled = UIImage(data: graduateIconFilledData, scale: 13.0)
                    let item = UITabBarItem(title: "Learn", image: image, selectedImage: imageFilled)
                    learnViewController.tabBarItem = item
                }
                return learnViewController
            case .favourite:
                let favouriteViewController = goJourney(.favourite)
                if let favouriteIconData = UIImage.starIcon?.pngData(),
                   let favouriteIconFilledData = UIImage.starIconFilled?.pngData() {
                    let image = UIImage(data: favouriteIconData, scale: 13.5)
                    let imageFilled = UIImage(data: favouriteIconFilledData, scale: 13.5)
                    let item = UITabBarItem(title: "Favourite", image: image, selectedImage: imageFilled)
                    favouriteViewController.tabBarItem = item
                }
                return favouriteViewController
            case .devDebug:
                let devViewController = goJourney(.devDebug)
                if let decIconData = UIImage.devIcon?.pngData(),
                   let devIconFilledData = UIImage.devIconFilled?.pngData() {
                    let image = UIImage(data: decIconData, scale: 17.0)
                    let imageFilled = UIImage(data: devIconFilledData, scale: 13.5)
                    let item = UITabBarItem(title: "Developer", image: image, selectedImage: imageFilled)
                    devViewController.tabBarItem = item
                }
                let devNavigation = UINavigationController(rootViewController: devViewController)
                return devNavigation
            }
        
        }
        
    }
    
    init() {}
    
    func configureApp(tabBarModules: [TabBarModule]) -> UITabBarController {
        setupNavBarAppearance()
        return buildTabBars(tabBarModules: tabBarModules)
    }
    
    func buildTabBars(tabBarModules: [TabBarModule]) -> UITabBarController {
        var controllers: [UIViewController] = []
        tabBarModules.forEach { tabBarType in
            controllers.append(tabBarType.buildModule())
        }
        
        let tabBar = setupTabBarAppearance(tabBar: UITabBarController())
        tabBar.setViewControllers(controllers, animated: true)
        tabBar.selectedIndex = 0
        
        return tabBar
    }
    
    func setupNavBarAppearance() {
        UINavigationBar.appearance().backgroundColor = .gendalf
        UINavigationBar.appearance().barTintColor = .gendalf
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.nazgul]
    }
    
    func setupTabBarAppearance(tabBar: UITabBarController) -> UITabBarController {
        tabBar.selectedIndex = 0
        tabBar.tabBar.isHidden = false
        tabBar.tabBar.isTranslucent = true
        
        let bounds = tabBar.tabBar.bounds as CGRect
        let visualEffectView = UIView() //UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = bounds
        visualEffectView.backgroundColor = .gendalf
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBar.tabBar.insertSubview(visualEffectView, at: 0)
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .mysteryShack
        UITabBar.appearance().unselectedItemTintColor = .gendalfGray
        
        return tabBar
    }
    
}
