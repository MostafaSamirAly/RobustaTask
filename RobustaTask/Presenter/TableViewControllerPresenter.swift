//
//  TableViewControllerPresenter.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class TableViewControllerPresenter: TableViewControllerPresenterProtocol {
    
    var displayRepositories: [RepositoryModel]?
    
    private weak var view: TableViewControllerProtocol?
    private var parser:RepositoryParserProtocol
    private var repositories:[RepositoryModel] = [RepositoryModel]()
    private var fetcher:RepositoryFetcher
    private var page: Int = 2
    init(view:TableViewControllerProtocol) {
        self.view = view
        self.parser = RepositoryParser()
        self.fetcher = RepositoryFetcher(parser: parser)
    }
    
    func fetchRepositories() {
        fetcher.fetchRepos(success: { [weak self] (response) in
            guard let self = self else { return }
            self.repositories = response
            self.displayRepositories = Array(response.prefix(10))
            self.view?.reloadView()
        }, error: { [weak self] error in
            guard let self = self else { return }
            self.view?.showError(error: error)
        })
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
        guard let item = displayRepositories?[indexPath.row] else { return }
        view?.navigateToInfoView(with: item)
    }
    
    func resetData() {
        page = 2
        displayRepositories = []
        repositories = []
    }
}
