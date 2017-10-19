//
//  AddToDoItemViewController.swift
//  To Do M1
//
//  Created by Christian Alvarez on 17/10/2017.
//  Copyright © 2017 Christian Alvarez. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    
    var stateController: ToDoListStateController?
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Return if cancel button is pressed
        guard let buttonPressed = sender as? UIBarButtonItem,
            buttonPressed != cancelButton else {
                return
        }
        
        //Check if done button was pressed
        if let buttonPressed = sender as? UIBarButtonItem,
            buttonPressed == doneButton,
            let stateController = stateController,
            let taskToAdd = taskTextField.text,
            !taskToAdd.isEmpty {
            //If the done button was pressed, the state controller exists, and the text field is not empty, add task.
            stateController.add(task: taskToAdd)
        }
        
    }
    
    
}
