//
//  ToDoListTableViewCell.swift
//  To Do M1
//
//  Created by Christian Alvarez on 17/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    static let identifier = "TaskCell"

    var taskName: String? {
        didSet {
            self.textLabel?.text = taskName
        }
    }
    
    var taskDone: Bool = false {
        didSet {
            accessoryType = taskDone ? .checkmark : .none
        }
    }

}
