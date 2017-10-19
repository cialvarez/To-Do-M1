//
//  ToDoListTableViewDelegate.swift
//  To Do M1
//
//  Created by Christian Alvarez on 16/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import UIKit


class ToDoListTableViewDelegate: NSObject {
    let stateController: ToDoListStateController
    
    init(tableView: UITableView, stateController: ToDoListStateController) {
        self.stateController = stateController
        super.init()
        tableView.delegate = self
    }
    
}

extension ToDoListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Deselect
        tableView.deselectRow(at: indexPath, animated: true)
        //Set new value
        stateController.toggleTaskCompletion(task: stateController.tasks[indexPath.row])
        //Reload tableview
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
