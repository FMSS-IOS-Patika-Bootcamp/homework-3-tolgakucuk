//
//  AddTodoViewModel.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation

class AddTodoViewModel {
    
    var name: String
    var dueDate: Date
    
    init(name: String, dueDate: Date) {
        self.name = name
        self.dueDate = dueDate
    }
    
    func didSaveClicked(completion: @escaping(Bool) -> Void)  {
        AddTodoModel.shared.saveTodo(name: self.name, dueOn: self.dueDate, completion: completion)
    }
    
}
