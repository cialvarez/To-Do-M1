//
//  Task+CoreDataProperties.swift
//  To Do M1
//
//  Created by Christian Alvarez on 17/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: entityName)
    }

    @NSManaged public var created: Date
    @NSManaged public var done: Bool
    @NSManaged public var name: String

    enum Keys {
        static let created = "created"
        static let done = "done"
        static let name = "name"
    }
    static let entityName = "Task"
    
}
