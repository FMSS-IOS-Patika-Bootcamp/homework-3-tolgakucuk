//
//  CoreDataStack.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else {
            return
        }
        do {
            try managedContext.save()
            print("DEBUG: Task saved succesfully")
        } catch let error as NSError {
            print("Unresolved error \(error)")
        }
    }
}
