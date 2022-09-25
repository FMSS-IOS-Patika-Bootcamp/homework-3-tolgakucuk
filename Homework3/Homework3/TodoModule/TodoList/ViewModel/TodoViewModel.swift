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
}
