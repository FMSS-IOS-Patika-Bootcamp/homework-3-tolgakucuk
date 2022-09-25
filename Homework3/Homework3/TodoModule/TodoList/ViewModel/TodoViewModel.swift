//
//  TodoViewModel.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation

class TodoViewModel {
    
    var todos =  [Todo]()
    
    var count: Int {
        return todos.count
    }
    
    init() {
        refreshData()
    }
    
    func todoAtIndex(_ index: Int) -> Todo {
        return todos[index]
    }
    
    func refreshData() {
        self.todos = TodoModel.shared.fetchTodos()
    }
    
    func completeTaskAtIndex(_ index: Int, completion: @escaping (Bool) -> Void) {
        self.refreshData()
        TodoModel.shared.completeTask(todo: todos[index], completion: completion)
    }
}
