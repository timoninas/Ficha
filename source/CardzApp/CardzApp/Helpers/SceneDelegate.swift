//
//  SceneDelegate.swift
//  CardzApp
//
//  Created by Антон Тимонин on 10.10.2021.
//

import UIKit
import Erebor
import RevolvetraKnowledge
import RevolvetraUserDefaults
import EyeOfSauron
import WidgetKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        fillDataBaseIfNeeded()
        refillWidgetWords()
        setupLogger()
        
        let appConfigurator = AppConfigurator()
        var tabBarModules: [AppConfigurator.TabBarModule] = [
            .daily,
            .learn,
            .favourite
        ]
        #if DEBUG
        tabBarModules.append(.devDebug)
        tabBarModules.append(.templateModule)
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
    
    private func refillWidgetWords() {
        let filling = {
            var newDailyWords: [DailyWordsUserDefaults] = []
            let types = ArkenstoneTypeWord.allCases
            types
                .shuffled()
                .prefix(6)
                .forEach { type in
                    guard type != .slang else { return }
                    let words = Array(MoriaManager.shared.getWordz(type: type)
                                        .filter({ $0.wordz.count < 12 })
                                        .shuffled()
                                        .prefix(3))
                    words.forEach { word in
                        newDailyWords.append(.init(
                            title: word.wordz,
                            transcription: word.transcription,
                            examples: word.examples,
                            translations: word.translations,
                            type: type.rawValue,
                            languageVersion: word.languageVersion.rawValue,
                            displayedCount: word.displayedCount
                        ))
                    }
                }
            DailyWordsUserDefaultsCache.saveForGroup(newDailyWords.shuffled())
            WidgetCenter.shared.reloadAllTimelines()
        }
        guard DaysChechker.isQuarterOfDay else {
            for _ in 0..<2 {
                guard DailyWordsUserDefaultsCache.getForGroup().isEmpty else { return }
                filling()
            }
            return
        }
        filling()
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
    
    private func setupLogger() {
        Logger.shared.add(ConsoleLogger())
        Logger.shared.add(OSLogger())
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
