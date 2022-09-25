//
//  TodoModel.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation
import CoreData
import CoreMedia

class TodoModel {
    
    static let shared = TodoModel()
    
    private init() {}
    
    func fetchTodos() -> [Todo] {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let firstByDate = NSSortDescriptor(key: #keyPath(Todo.addedDate), ascending: false)
        request.sortDescriptors = [firstByDate]
        var todos = [Todo]()
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            todos = try context.fetch(request)
        } catch let error {
            print("DEBUG: Error while trying to fetch todos: \(error.localizedDescription)")
        }
        return todos
    }
    
    func completeTask(todo t: Todo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let result = try context.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                todo.completed = true
                AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
                completion(true)
            }
        } catch let error {
            print("DEBUG: Error white triying to complete task: \(error.localizedDescription)")
        }
    }
}
