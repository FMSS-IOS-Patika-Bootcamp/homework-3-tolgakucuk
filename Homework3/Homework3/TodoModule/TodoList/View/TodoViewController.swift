//
//  TodoViewController.swift
//  Homework3
//
//  Created by Tolga on 24.09.2022.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var plusButton: UIButton!
    
    var viewModel = TodoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.refreshData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    
    @IBAction func didPlusButtonClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTodoViewController") as! AddTodoViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

private extension TodoViewController {
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        
        plusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = 36
        
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.todosCellIdentifier)
    }
}



extension TodoViewController: UITableViewDelegate {
    
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.todosCellIdentifier) as! TodoTableViewCell
        cell.todo = viewModel.todoAtIndex(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = viewModel.todoAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        if todo.completed == false {
            let alertController = UIAlertController(title: "Complete?", message: "Do you want to mark completed this task", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Complete", style: .default, handler: { _ in
                self.viewModel.completeTaskAtIndex(indexPath.row) { _ in
                    self.tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "Not Complete", style: .destructive, handler: nil))
            present(alertController, animated: true)
        }
    }
    
}

