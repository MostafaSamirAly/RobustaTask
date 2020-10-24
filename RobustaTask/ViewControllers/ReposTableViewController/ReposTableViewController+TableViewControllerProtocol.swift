//
//  ReposTableViewController+TableViewControllerProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/24/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

extension ReposTableViewController: ReposTableViewControllerProtocol {
    func reloadView() {

        if presenter?.displayRepositories?.count == 0 {
            reposTableView.setEmptyView(title: "Please Wait", message: "Loading")
        }  else {
            reposTableView.resetTableView()
        }
        refreshController.endRefreshing()
        reposTableView.reloadData()
    }
    
    func showError(error: Error) {
        reposTableView.setEmptyView(title: "Error", message: "Pull to refresh")
        Helper.showErrorAlert(view: self, error: error.localizedDescription)
        refreshController.endRefreshing()
    }
    
    func navigateToInfoView(with repo:RepositoryModel){
        guard let infoVC = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController else{
            Helper.showErrorAlert(view: self, error: "Cannot open repository's details")
            return}
        let infoPresenter = InfoViewControllerPresenter(view: infoVC)
        infoPresenter.setRepository(repo: repo)
        infoVC.presenter = infoPresenter
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}
