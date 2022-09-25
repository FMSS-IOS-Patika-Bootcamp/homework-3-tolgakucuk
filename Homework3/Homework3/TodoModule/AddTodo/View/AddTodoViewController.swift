//
//  AddTodoViewController.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var dueOnDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        saveButton.layer.cornerRadius = 8
        
        dueOnDatePicker.minimumDate = Date()
    }
    
    @IBAction func didSaveButtonClicked(_ sender: Any) {
        handleSaveButtonClicked(task: taskLabel.text, dueOn: dueOnDatePicker.date)
    }
    
    private func handleSaveButtonClicked(task: String?, dueOn: Date) {
        guard let task = task, !task.isEmpty else {
            showAlert(withMessage: "Please enter your task")
            return
        }
        let viewModel = AddTodoViewModel(name: task, dueDate: dueOn)
        viewModel.didSaveClicked { _ in
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    private func showAlert(withMessage message: String?) {
        guard let message = message else {return}
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

}
