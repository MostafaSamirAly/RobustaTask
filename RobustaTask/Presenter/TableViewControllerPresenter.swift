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
    private var fetcher:RepositoryFetcher
    init(view:TableViewControllerProtocol) {
        self.view = view
        self.parser = RepositoryParser()
        self.fetcher = RepositoryFetcher(parser: parser)
    }
    
    func fetchRepositories() {
        fetcher.fetchRepos(success: { [weak self] (response) in
            self?.repositories = response
            self?.view?.reloadView()
        }, error: { [weak self] error in
            self?.view?.showError(error: error)
        })
    }
    
    func getRepositoriesCount() -> Int {
        return repositories.count
    }
    
    func getRepository(at indexPath: IndexPath) -> RepositoryModel {
        return repositories[indexPath.row]
    }

}
