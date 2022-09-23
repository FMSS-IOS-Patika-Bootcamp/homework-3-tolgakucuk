//
//  PostListTableViewCell.swift
//  Homework3
//
//  Created by Tolga on 23.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI() 
    }
    
    private func configureCellUI() {
        containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
    }
}
