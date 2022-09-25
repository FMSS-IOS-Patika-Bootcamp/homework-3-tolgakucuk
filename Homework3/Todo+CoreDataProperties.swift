//
//  Todo+CoreDataProperties.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var dueOn: Date?
    @NSManaged public var completed: Bool
    @NSManaged public var addedDate: Date?

}

extension Todo : Identifiable {

}
