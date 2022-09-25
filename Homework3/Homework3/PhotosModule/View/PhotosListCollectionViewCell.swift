//
//  PhotosListCollectionViewCell.swift
//  Homework3
//
//  Created by Tolga on 24.09.2022.
//

import UIKit
import Kingfisher

class PhotosListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }
    
    private func configureCellUI() {
        containerView.layer.cornerRadius = 8
    }

}
