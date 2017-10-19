//
//  ToDoListStateController.swift
//  To Do M1
//
//  Created by Christian Alvarez on 16/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import Foundation
import CoreData

class ToDoListStateController {
    //MARK: - Properties
    private var context: NSManagedObjectContext?
    private(set) var tasks = [Task]()
    
    //MARK: - Init Methods
    init() {}
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.tasks = fetchTasks()
    }
    
    //MARK: - Create New Task
    
    /* Creates an entity with the following attributes:
            name(String) - supplied by user
            done(Bool) - supplied by method
            created(Date) - supplied by method
     */
    
    func add(task: String) {
        guard let context = context else{
            print("Error - could not save new object")
            return
        }
        
        if let newTask = NSEntityDescription.insertNewObject(forEntityName: Task.entityName, into: context) as? Task {
            newTask.setValue(task, forKey: Task.Keys.name)
            newTask.setValue(false, forKey: Task.Keys.done) //By default, a new task is marked as 'not done'
            newTask.setValue(Date(), forKey: Task.Keys.created) //Set current date to the task created
            do {
                try context.save()
                //All new tasks are pushed to the top.
                tasks.insert(newTask, at: 0)
            } catch let error as NSError {
                print("Could not save new task! \(error)")
            }
        }
    }
    
    //MARK: - Delete Task
    
    // Deletes a task located at specified index.

    func deleteTask(at index: Int) {
        guard let context = context else {
            print("Error - no context passed. Could not delete task")
            return
        }
        
        context.delete(tasks[index])
        
        do {
            try context.save()
            tasks.remove(at: index)
        } catch let error as NSError {
            print("Could not commit delete action. \(error)")
        }
        
    }
    
    //MARK: - Edit Task (done or not)
    
    // Changes task state to done/not done
    
    func toggleTaskCompletion(task: Task) {
        //Set new value (done or not)
        task.setValue(!task.done, forKey: Task.Keys.done)

        do {
            try context?.save()
        } catch let error as NSError {
            print("Error setting task as \(!task.done ? "not done" : "done") with error code: \(error)")
        }

    }

    //MARK: - Read Tasks
    //Fetches all tasks and returns an array of Task NSManagedObjects
    
    private func fetchTasks() -> [Task] {
        
        do {
            let request: NSFetchRequest<Task> = Task.fetchRequest()
            let descriptor = NSSortDescriptor(key: Task.Keys.created, ascending: false)
            request.sortDescriptors = [descriptor]
            let tasks = try context?.fetch(request)
            self.tasks = tasks!
        } catch let error as NSError {
            print("No data yet. Creating empty tasks array \(error)")
            self.tasks = [Task]()
        }
        return self.tasks
    }
    
    
}
