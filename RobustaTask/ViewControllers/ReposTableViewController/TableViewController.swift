//
//  ReposTableViewController.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class ReposTableViewController: UIViewController {
    var presenter: TableViewControllerPresenterProtocol?
    private let tableViewCellIdentifier = "TableViewCell"
    let refreshController = UIRefreshControl()
    @IBOutlet weak var reposTableView: UITableView! {
        didSet {
            reposTableView.delegate = self
            reposTableView.dataSource = self
            reposTableView.prefetchDataSource = self
            reposTableView.register(UINib(nibName: String(describing:TableViewCell.self), bundle: nil),
                                    forCellReuseIdentifier: tableViewCellIdentifier)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TableViewControllerPresenter(view: self)
        setupRefreshControl()
        presenter?.fetchRepositories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = "GitHub Repositories"
    }
    
    private func setupRefreshControl(){
        refreshController.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshController.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        reposTableView.addSubview(refreshController)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        presenter?.resetData()
        presenter?.fetchRepositories()
    }
}

extension ReposTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.displayRepositories?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reposTableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier,
                                                            for: indexPath) as? TableViewCell,
              let repo = presenter?.displayRepositories?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setupCell(repo: repo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 9
    }
}

extension ReposTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}



extension ReposTableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let reposCount = presenter?.displayRepositories?.count, reposCount != 0 ,
            let index = indexPaths.last else {
            return
        }
        if index.row >= reposCount - 1 && reposCount < 100 {
            presenter?.displayMore()
        }
    }
}
