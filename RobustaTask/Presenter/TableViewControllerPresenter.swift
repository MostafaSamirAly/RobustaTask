//
//  TableViewControllerPresenter.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class TableViewControllerPresenter: TableViewControllerPresenterProtocol {
    
    private weak var view: TableViewControllerProtocol?
    private var parser:RepositoryParserProtocol
    private var repositories:[RepositoryModel] = [RepositoryModel]()
    private var displayRepositories:[RepositoryModel] = [RepositoryModel]()
    private var fetcher:RepositoryFetcher
    private var page:Int = 2
    init(view:TableViewControllerProtocol) {
        self.view = view
        self.parser = RepositoryParser()
        self.fetcher = RepositoryFetcher(parser: parser)
    }
    
    func fetchRepositories() {
        fetcher.fetchRepos(success: { [weak self] (response) in
            self?.repositories = response
            self?.displayRepositories = Array(response.prefix(10))
            self?.view?.reloadView()
        }, error: { [weak self] error in
            self?.view?.showError(error: error)
        })
    }
    
    func getRepositoriesCount() -> Int {
        return displayRepositories.count
    }
    
    func getRepository(at indexPath: IndexPath) -> RepositoryModel {
        return displayRepositories[indexPath.row]
    }
    
    func displayMore() {
        if (page*10) >= repositories.count{
            displayRepositories = repositories
        }else{
            displayRepositories = Array(repositories.prefix(page*10))
            page += 1
        }
        self.view?.reloadView()
    }
    
    func didSelectItem(at indexPath:IndexPath){
        let item = self.displayRepositories[indexPath.row]
        self.view?.navigateToInfoView(with: item)
    }
}
