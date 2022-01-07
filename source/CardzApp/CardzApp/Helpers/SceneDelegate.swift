//
//  SceneDelegate.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Erebor
import RevolvetraKnowledge

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        fillDataBaseIfNeeded()
        
        let todayViewController = DailyWordsBuilder.build()
        if let todayIconData = UIImage.todayIcon?.pngData(),
           let todayIconFilledData = UIImage.todayIconFilled?.pngData() {
            let image = UIImage(data: todayIconData, scale: 13.0)
            let imageFilled = UIImage(data: todayIconFilledData, scale: 13.0)
            let item = UITabBarItem(title: "Daily", image: image, selectedImage: imageFilled)
            todayViewController.tabBarItem = item
        }
        
        let learnViewController = LearnNewWordzBuilder.build()
        if let graduateIconData = UIImage.graduateIcon?.pngData() ,
           let graduateIconFilledData = UIImage.graduateIconFilled?.pngData() {
            let image = UIImage(data: graduateIconData, scale: 13.0)
            let imageFilled = UIImage(data: graduateIconFilledData, scale: 13.0)
            let item = UITabBarItem(title: "Learn", image: image, selectedImage: imageFilled)
            learnViewController.tabBarItem = item
        }
        
        let favouriteViewController = FavouriteWordzBuilder.build()
        if let favouriteIconData = UIImage.starIcon?.pngData(),
           let favouriteIconFilledData = UIImage.starIconFilled?.pngData() {
            let image = UIImage(data: favouriteIconData, scale: 13.5)
            let imageFilled = UIImage(data: favouriteIconFilledData, scale: 13.5)
            let item = UITabBarItem(title: "Favourite", image: image, selectedImage: imageFilled)
            favouriteViewController.tabBarItem = item
        }
        
        let devViewController = DevDebugBuilder.build()
        if let decIconData = UIImage.devIcon?.pngData(),
           let devIconFilledData = UIImage.devIconFilled?.pngData() {
            let image = UIImage(data: decIconData, scale: 17.0)
            let imageFilled = UIImage(data: devIconFilledData, scale: 13.5)
            let item = UITabBarItem(title: "Developer", image: image, selectedImage: imageFilled)
            devViewController.tabBarItem = item
        }
        
        let tabBar = UITabBarController()
        var viewControllers = [todayViewController, learnViewController, favouriteViewController]
        #if DEBUG
        viewControllers.append(devViewController)
        #endif
        tabBar.setViewControllers(viewControllers, animated: true)
        tabBar.selectedViewController = todayViewController
        tabBar.selectedIndex = 0
        tabBar.tabBar.isHidden = false
        tabBar.tabBar.isTranslucent = true
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .mysteryShack
        UITabBar.appearance().unselectedItemTintColor = .gendalfGray
        
        let bounds = tabBar.tabBar.bounds as CGRect
        let visualEffectView = UIView() //UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = bounds
        visualEffectView.backgroundColor = .gendalf
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBar.tabBar.insertSubview(visualEffectView, at: 0)
        
        UINavigationBar.appearance().backgroundColor = .gendalf
        UINavigationBar.appearance().barTintColor = .gendalf
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.nazgul]
        
        window?.windowScene = windowScene
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    private func fillDataBaseIfNeeded() {
        if KnowledgeDevice.previousAppVersion.isEmpty
            || KnowledgeDevice.previousAppVersion != KnowledgeDevice.appVersion {
            KnowledgeDevice.previousAppVersion = (KnowledgeDevice.appVersion ?? "")
            MoriaManager.shared.deleteAllWordz(except: [.favourite])
            
            let wordaGotta = WordaGotta()
            wordaGotta.gottaAllWords().forEach { bagOfGoldWords in
                bagOfGoldWords.words.forEach { word in
                    MoriaManager.shared.addWordz(
                        wordz: word.word,
                        transcription: word.transcription,
                        examples: word.examples,
                        translations: word.translations,
                        type: bagOfGoldWords.typeWord,
                        languageVersion: bagOfGoldWords.typeTranslation
                    )
                }
            }
        }
        
    }
    
}

//
//        **  ~~~~~~~~~~~~~~~  **
//        **  ---------------  **
//        **  ---------------  **
//        **  ---------------  **
//         **  -------------  **
//          **  -----------  **
//           **  ---------  **
//            ***************
//             *************
//                  ***
//                  ***
//              ***********
//             *************
//
