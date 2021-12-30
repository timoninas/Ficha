//
//  PersistentContainer.swift
//  
//
//  Created by Антон Тимонин on 30.12.2021.
//

import UIKit
import CoreData

//open class PersistentContainer: NSPersistentContainer {
//}
//
//public var moriaPersistentContainer: PersistentContainer? = {
//    guard let modelURL = Bundle.module.url(
//        forResource: "MoriaWithWords",
//        withExtension: ".momd"
//    ) else {
//        return nil
//    }
//    
//    guard let model = NSManagedObjectModel(
//        contentsOf: modelURL
//    ) else {
//        return nil
//    }
//    
//    let container = PersistentContainer(
//        name:"MoriaWithWords",
//        managedObjectModel: model
//    )
//    
//    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//        if let error = error as NSError? {
//            print("Unresolved error \(error), \(error.userInfo)")
//        }
//    })
//    
//    return container
//}()
