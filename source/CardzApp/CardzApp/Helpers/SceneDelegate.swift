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
        
        let appConfigurator = AppConfigurator()
        var tabBarModules: [AppConfigurator.TabBarModule] = [
            .daily,
            .learn,
            .favourite
        ]
        #if DEBUG
        tabBarModules.append(.devDebug)
        #endif
        
        window?.windowScene = windowScene
        window?.rootViewController = appConfigurator.buildTabBars(tabBarModules: tabBarModules)
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
