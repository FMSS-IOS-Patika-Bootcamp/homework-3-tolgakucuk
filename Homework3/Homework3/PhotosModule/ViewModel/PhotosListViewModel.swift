//
//  PhotosListViewModel.swift
//  Homework3
//
//  Created by Tolga on 24.09.2022.
//

import Foundation

protocol PhotosListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PhotoCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class PhotosListViewModel {
    
    weak var delegate: PhotosListViewModelViewProtocol?
    
    private let model = PhotoListModel()
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.photos[index]
        //TODO: NAVIGATE
    }
}


private extension PhotosListViewModel {
    @discardableResult
    func makeViewBasedModel(_ photos: [Photo]) -> [PhotoCellViewModel] {
        return photos.map {.init(url: $0.url)}
    }
}

extension PhotosListViewModel: PhotoListModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let photos = model.photos
            let cellModels = makeViewBasedModel(photos)
            delegate?.didCellItemFetch(cellModels)
            delegate?.hideEmptyView()
        } else {
            delegate?.showEmptyView()
        }
    }
}


