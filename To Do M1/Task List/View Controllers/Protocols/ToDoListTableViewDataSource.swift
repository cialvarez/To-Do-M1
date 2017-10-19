//
//  ToDoListTableViewDataSource.swift
//  To Do M1
//
//  Created by Christian Alvarez on 16/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import UIKit

class ToDoListTableViewDataSource: NSObject {
    let stateController: ToDoListStateController
    
    init(tableView: UITableView, stateController: ToDoListStateController) {
        self.stateController = stateController
        super.init()
        tableView.dataSource = self
    }
}


extension ToDoListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.tasks.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        if stateController.tasks.count > 0 {
            let date = stateController.tasks.last?.created
            //temporarily return latest date from last object
            return dateFormatter.string(from: date!)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoListTableViewCell.identifier) as? ToDoListTableViewCell else {
            print("Unable to cast cell as ToDoListTableViewCell! Creating empty cell so the program won't crash")
            return UITableViewCell(style: .default, reuseIdentifier: ToDoListTableViewCell.identifier)
        }
        
        cell.taskName = stateController.tasks[indexPath.row].name
        cell.taskDone = stateController.tasks[indexPath.row].done
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            stateController.deleteTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    
    
    
}
