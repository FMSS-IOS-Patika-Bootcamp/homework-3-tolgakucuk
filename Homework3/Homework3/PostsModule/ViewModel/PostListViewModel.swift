//
//  PostListViewModel.swift
//  Homework3
//
//  Created by Tolga on 23.09.2022.
//

protocol PostListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class PostListViewModel {
    
    weak var delegate: PostListViewModelViewProtocol?
    
    private let model = PostListModel()
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.posts[index]
        //TODO: NAVIGATE
    }
}

private extension PostListViewModel {
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] {
        return posts.map { .init(title: $0.title, desc: $0.body) }
    }
}

//MARK: - PostListModelPrortocol
extension PostListViewModel: PostListModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            delegate?.didCellItemFetch(cellModels)
            delegate?.hideEmptyView()
        } else {
            delegate?.showEmptyView()
        }
        
    }
}

