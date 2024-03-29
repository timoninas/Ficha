//
//  MoriaManager.swift
//  
//
//  Created by Антон Тимонин on 30.12.2021.
//

import Foundation
import CoreData
import Erebor

public protocol MoriaManagerProtocol {
    
    func addWordz(model: WordzModelDB)
}

public class MoriaManager: MoriaManagerProtocol {
    
    // MARK: - Public properties
    
    public static var shared = MoriaManager()
    
    // MARK: - Private properties
    
    private struct Constants {
        
        static var xcdatamodel: String { "CardzApp" }
        
        static var separator: String { "--]{xOx}[--" }
        
    }
    
    private struct Entitites {
        
        static var wordz: String { "WordzEntity" }
        
    }
    
    private var arrayToDBValue: ([String]) -> String = {
        var result = ""
        $0.enumerated().forEach { idx, value in
            if idx == 0 {
                result += value
            } else {
                result += "\(Constants.separator)\(value)"
            }
        }
        return result
    }
    
    private var DBValueToArray: (String) -> [String] = {
        $0.components(separatedBy: Constants.separator)
    }
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.xcdatamodel)
        container.loadPersistentStores { _, error in
            if let error {
                RLogError(error: error)
                fatalError("Failed: \(String(describing: error))")
            }
        }
        return container
    }()
    
    private lazy var context = persistentContainer.viewContext
    
    private let lockQueue = DispatchQueue(label: "bank.lock.queue")
    
    // MARK: - Public methods
    
    public func addWordz(model: WordzModelDB) {
        self.addWordz(
            wordz: model.wordz,
            transcription: model.transcription,
            examples: model.examples,
            translations: model.translations,
            type: model.type,
            languageVersion: model.languageVersion
        )
    }
    
    public func addWordz(
        wordz: String,
        transcription: String?,
        examples: [String],
        translations: [String],
        type: ArkenstoneTypeWord,
        languageVersion: SilverTypeTranslation
    ) {
        syncMain {
            let excitedWords = getWordz(word: wordz, translations: translations)
                .filter { $0.type == type }
            guard excitedWords.count == 0 else {
                return
            }
            
            let wordzEntity = NSEntityDescription.insertNewObject(
                forEntityName: Entitites.wordz,
                into: self.context
            )
            
            wordzEntity.setValue(wordz, forKey: "wordz")
            wordzEntity.setValue(transcription, forKey: "transcription")
            wordzEntity.setValue(type.rawValue, forKey: "type")
            wordzEntity.setValue(languageVersion.rawValue, forKey: "languageVersion")
            wordzEntity.setValue(0, forKey: "displayedCount")
            wordzEntity.setValue(arrayToDBValue(examples), forKey: "examples")
            wordzEntity.setValue(arrayToDBValue(translations), forKey: "translations")
            
            do {
                try context.save()
                RLogInfo(message: "Saved \(wordzEntity)", subsystem: String(describing: self))
            } catch {
                RLogError(error: error, subsystem: String(describing: self))
            }
        }
    }
    
    public func updateWordz(
        wordz: String,
        translations: [String],
        type: ArkenstoneTypeWord,
        languageVersion: SilverTypeTranslation,
        count: Int64
    ) {
        syncMain {
            let fetchRequest: NSFetchRequest<WordzEntity> = WordzEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "wordz = %@ AND translations = %@ AND type = %@ AND languageVersion = %@",
                argumentArray: [
                    wordz,
                    arrayToDBValue(translations),
                    type.rawValue,
                    languageVersion.rawValue
                ]
            )
            
            do {
                let wordz = try context.fetch(fetchRequest)
                wordz.forEach {
                    $0.displayedCount = count
                    RLogInfo(message: "Updated entity wordz: \($0)", subsystem: String(describing: self))
                }
                try context.save()
            } catch {
                RLogError(error: error, subsystem: String(describing: self))
            }
        }
    }
    
    public func updateWordz(
        type: ArkenstoneTypeWord,
        languageVersion: SilverTypeTranslation,
        count: Int64
    ) {
        syncMain {
            let fetchRequest: NSFetchRequest<WordzEntity> = WordzEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(
                format: "type = %@ AND languageVersion = %@",
                argumentArray: [
                    type.rawValue,
                    languageVersion.rawValue
                ]
            )
            
            do {
                let wordz = try context.fetch(fetchRequest)
                wordz.forEach {
                    $0.displayedCount = count
                    RLogInfo(message: "Updated entity wordz: \($0)", subsystem: String(describing: self))
                }
                try context.save()
            } catch {
                RLogError(error: error, subsystem: String(describing: self))
            }
        }
    }
    
    public func getWordz(type: ArkenstoneTypeWord, typeTranslation: SilverTypeTranslation? = nil) -> [WordzModelDB] {
        syncMain {
            let fetchRequest = NSFetchRequest<WordzEntity>(entityName: Entitites.wordz)
            let resultArray: [WordzModelDB]
            do {
                var wordz = try context.fetch(fetchRequest)
                wordz = wordz.filter{
                    if let typeTranslation {
                        return $0.type == type.rawValue
                        && $0.languageVersion == typeTranslation.rawValue
                    } else {
                        return $0.type == type.rawValue
                    }
                }
                resultArray = wordz.map {
                    WordzModelDB(
                        wordz: $0.wordz ?? "",
                        transcription: $0.transcription,
                        examples: DBValueToArray($0.examples ?? ""),
                        translations: DBValueToArray($0.translations ?? ""),
                        type: (.init(rawValue: $0.type ?? "") ?? .unknown),
                        languageVersion: .init(rawValue: $0.languageVersion ?? "") ?? .unknown,
                        displayedCount: Int64($0.displayedCount)
                    )
                }
            } catch {
                resultArray = []
            }
            return resultArray
        }
    }
    
    public func getWordz(word: String, translations: [String]) -> [WordzModelDB] {
        syncMain {
            let fetchRequest = NSFetchRequest<WordzEntity>(entityName: Entitites.wordz)
            let resultArray: [WordzModelDB]
            do {
                var wordz = try context.fetch(fetchRequest)
                wordz = wordz.filter{ [weak self] in
                    guard let self else { return false }
                    return $0.wordz == word
                    && $0.translations == self.arrayToDBValue(translations)
                }
                resultArray = wordz.map {
                    WordzModelDB(
                        wordz: $0.wordz ?? "",
                        transcription: $0.transcription,
                        examples: DBValueToArray($0.examples ?? ""),
                        translations: DBValueToArray($0.translations ?? ""),
                        type: (.init(rawValue: $0.type ?? "") ?? .unknown),
                        languageVersion: .init(rawValue: $0.languageVersion ?? "") ?? .unknown,
                        displayedCount: Int64($0.displayedCount)
                    )
                }
            } catch {
                resultArray = []
            }
            return resultArray
        }
    }
    
    public func deleteWordz(with wordz: String, translations: [String], type: ArkenstoneTypeWord) {
        syncMain {
            let fetchRequest: NSFetchRequest<WordzEntity> = WordzEntity.fetchRequest()
            let predicate1 = NSPredicate(format: "%K = %@", "wordz", wordz)
            let predicate2 = NSPredicate(format: "%K = %@", "translations", arrayToDBValue(translations))
            let predicate3 = NSPredicate(format: "%K = %@", "type", type.rawValue)
            let compound = NSCompoundPredicate.init(andPredicateWithSubpredicates: [
                predicate1, predicate2, predicate3
            ])
            fetchRequest.predicate = compound
            do {
                if let result = try? context.fetch(fetchRequest) {
                    for object in result {
                        context.delete(object)
                        RLogInfo(message: "Delete entity wordz: \(object) - \(object.wordz ?? "")", subsystem: String(describing: self))
                    }
                }
                try context.save()
                
            } catch {
                RLogError(error: error, subsystem: String(describing: self))
            }
        }
    }
    
    public func deleteWordz(with type: ArkenstoneTypeWord) {
        syncMain {
            let fetchRequest: NSFetchRequest<WordzEntity> = WordzEntity.fetchRequest()
            let predicate = NSPredicate(format: "%K = %@", "type", type.rawValue)
            fetchRequest.predicate = predicate
            do {
                if let result = try? context.fetch(fetchRequest) {
                    for object in result {
                        context.delete(object)
                        RLogInfo(message: "Delete entity wordz: \(object) - \(object.wordz ?? "")", subsystem: String(describing: self))
                    }
                }
                try context.save()
            } catch {
                RLogError(error: error, subsystem: String(describing: self))
            }
        }
    }
    
    public func deleteAllWordz(except: [ArkenstoneTypeWord] = []) {
        syncMain {
            ArkenstoneTypeWord.allCases.forEach {
                guard !except.contains($0) else { return }
                let fetchRequest: NSFetchRequest<WordzEntity> = WordzEntity.fetchRequest()
                let predicate = NSPredicate(format: "%K = %@", "type", $0.rawValue)
                fetchRequest.predicate = predicate
                do {
                    if let result = try? context.fetch(fetchRequest) {
                        for object in result {
                            context.delete(object)
                            RLogInfo(message: "Delete entity wordz: \(object) - \(object.wordz ?? "")", subsystem: String(describing: self))
                        }
                    }
                    try context.save()
                } catch {
                    RLogError(error: error, subsystem: String(describing: self))
                }
            }
        }
    }
    
    private func syncMain<T>(_ closure: () -> T) -> T {
        if Thread.isMainThread {
            return closure()
        } else {
            return lockQueue.sync(execute: closure)
        }
    }
    
}
