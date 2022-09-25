//
//  ViewController.swift
//  Homework3
//
//  Created by Tolga on 23.09.2022.
//

import UIKit

class PostListViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        viewModel.delegate = self
        viewModel.didViewLoad()
    }
}

private extension PostListViewController {
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
    
    func registerCell() {
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.postCellIdentifier)
    }
     
}

extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
}

extension PostListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier) as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
}

extension PostListViewController: PostListViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func showEmptyView() {
        // TODO:
    }
    
    func hideEmptyView() {
        // TODO:
    }
}

