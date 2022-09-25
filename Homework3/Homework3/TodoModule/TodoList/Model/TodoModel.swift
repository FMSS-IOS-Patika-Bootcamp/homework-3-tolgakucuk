//
//  TodoModel.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation
import CoreData

class TodoModel {
    
    static let shared = TodoModel()
    
    private init() {}
    
    func fetchTodos() -> [Todo] {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        var todos = [Todo]()
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            todos = try context.fetch(request)
        } catch let error {
            print("DEBUG: Error while trying to fetch todos: \(error.localizedDescription)")
        }
        return todos
    }
}
