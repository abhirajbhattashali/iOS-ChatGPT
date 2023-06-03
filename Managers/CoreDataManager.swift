//
//  CoreDataManager.swift
//  ChatGPTApp
//
//  Created by Abhiraj on 03/05/23.
//

import Foundation

import CoreData

class CoreDataManager{
    let persistentContainer:NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        
        self.persistentContainer = NSPersistentContainer(name:"HistoryModel")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error{
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
}
