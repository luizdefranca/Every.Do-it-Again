//
//  AddTodoViewController.swift
//  Every
//
//  Created by Luiz on 6/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit
import CoreData

protocol AddTodoDelegate: class {
    func addTodo(_ todo: ToDo)
}

class AddTodoViewController: UIViewController {

    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var descriptionTextView: UITextField!

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var priorityStepper: UIStepper!

    weak var delegate : AddTodoDelegate?
    var todo: ToDo? = nil
    var managedObjectContext: NSManagedObjectContext? 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.completedSwitch.isOn = false
        self.hideKeyboardWhenTappedAround()
        self.titleTextField.becomeFirstResponder()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateView()
    }

    @IBAction func isCompleted(_ sender: UISwitch) {
//        todo.isCompleted = completedSwitch.isOn
    }

    @IBAction func changePriority(_ sender: UIStepper) {
        priorityLabel.text = String(priorityStepper.value)
//        todo.priorityNumber = Int16(priorityStepper.value)
    }

    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: UIButton) {
        guard let context = managedObjectContext else {
            return
        }
        self.todo = ToDo(context: context )
        let title = titleTextField.text
        let descriptionT = descriptionTextView.text
        let completed = completedSwitch.isOn
        let priority = Int16(priorityStepper.value)
        todo!.isCompleted = completed
        todo!.todoDescription = descriptionT
        todo!.title = title
        todo!.priorityNumber = priority
        self.delegate?.addTodo(todo!)
        self.dismiss(animated: true, completion: nil)

    }

    func animateView() {
        self.alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
}

 //add in the viewDidLoad Method

extension AddTodoViewController { //change the name for your ViewController
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddTodoViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

