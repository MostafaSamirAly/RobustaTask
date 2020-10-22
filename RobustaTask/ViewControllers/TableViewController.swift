//
//  TableViewController.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    private var presenter: TableViewControllerPresenterProtocol?
    private let tableViewCellIdentifier = "TableViewCell"
    @IBOutlet weak var reposTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = TableViewControllerPresenter(view:self)
        self.setupView()
        presenter?.fetchRepositories()
        // Do any additional setup after loading the view.
    }

    func setupView(){
        reposTableView.delegate = self
        reposTableView.dataSource = self
        let customCellNib: UINib = UINib(nibName: String(describing:TableViewCell.self), bundle: nil)
        reposTableView.register(customCellNib, forCellReuseIdentifier: tableViewCellIdentifier)
        self.navigationController?.navigationBar.topItem?.title = "GitHub Repositories"
    }
}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getRepositoriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reposTableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? TableViewCell else{return UITableViewCell()}
        cell.setupCell(repo: (presenter?.getRepository(at: indexPath) ?? RepositoryModel()))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
}

extension TableViewController: UITableViewDelegate{
    
}

extension TableViewController: TableViewControllerProtocol{
    func reloadView() {
        self.reposTableView.reloadData()
    }
    
    func showError(error: Error) {
        Helper.showErrorAlert(view: self, error: error)
    }
    
    
}
