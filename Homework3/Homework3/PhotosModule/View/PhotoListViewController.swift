//
//  PhotosViewController.swift
//  Homework3
//
//  Created by Tolga on 23.09.2022.
//

import UIKit
import Kingfisher

class PhotoListViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = PhotosListViewModel()
    private var items: [PhotoCellViewModel] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.didViewLoad()
        configureUI()
    }
}

private extension PhotoListViewController {
    func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCell()
    }
    
    
    func registerCell() {
        collectionView.register(.init(nibName: "PhotosListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.photosCellIdentifier)
    }
}

extension PhotoListViewController: UICollectionViewDelegate {
    
}

extension PhotoListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photosCellIdentifier, for: indexPath) as! PhotosListCollectionViewCell
        let url = URL.init(string: items[indexPath.row].url ?? "")
        cell.imageView.kf.setImage(with: url)
        return cell
    }
}


extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4 , bottom: 4, right: 4)
    }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 48) / 4
        return .init(width: width, height: width)
    }
}

extension PhotoListViewController: PhotosListViewModelViewProtocol {
    func didCellItemFetch(_ items: [PhotoCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    func showEmptyView() {
        //TODO:
    }
    
    func hideEmptyView() {
        //TODO:
    }
}
