//
//  TodoTableViewCell.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var dueOnLabel: UILabel!
    @IBOutlet weak var completedImage: UIImageView!
    
    var todo: Todo? {
        didSet {
            if let todo = todo {
                if todo.completed == false {
                    taskNameLabel.text = todo.name
                    dueOnLabel.text = String(format: "Due on: %@", todo.dueOn!.toString(format: "MMM dd, yy"))
                } else {
                    taskNameLabel.text = todo.name
                    dueOnLabel.text = String(format: "Due on: %@", todo.dueOn!.toString(format: "MMM dd, yy"))
                    completedImage.image = UIImage(named: "completed")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
    
}
