//
//  ToDoListTableViewController.swift
//  To Do M1
//
//  Created by Christian Alvarez on 16/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoListStateController: ToDoListStateController?
    var toDoListDelegate: ToDoListTableViewDelegate?
    var toDoListDataSource: ToDoListTableViewDataSource?
    
    //MARK: - Navigation Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let stateController = toDoListStateController {
            toDoListDelegate = ToDoListTableViewDelegate(tableView: self.tableView, stateController: stateController)
            toDoListDataSource = ToDoListTableViewDataSource(tableView: self.tableView, stateController: stateController)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let topViewController = navigationController.topViewController as? AddToDoItemViewController {
            topViewController.stateController = self.toDoListStateController
        }
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        //Empty function to allow unwind segue
    }
    

    

    
}
