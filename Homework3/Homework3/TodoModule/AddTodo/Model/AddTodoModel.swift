//
//  AddTodoModel.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation

class AddTodoModel {
    
    static let shared = AddTodoModel()
    
    private init() {}
    
    func saveTodo(name: String, dueOn: Date, completion: @escaping(Bool) -> Void) {
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let todo = Todo(context: managedContext)
        todo.setValue(name, forKeyPath: #keyPath(Todo.name))
        todo.setValue(dueOn, forKeyPath: #keyPath(Todo.dueOn))
        todo.id = UUID()
        todo.setValue(false, forKeyPath: #keyPath(Todo.completed))
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        completion(true)
    }
}
