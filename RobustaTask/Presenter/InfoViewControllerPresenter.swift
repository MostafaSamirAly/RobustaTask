//
//  InfoViewControllerPresenter.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class InfoViewControllerPresenter: InfoViewControllerPresenterProtocol {
    
    private weak var view: InfoViewControllerProtocol?
    private var infoRepository:RepositoryModel?
    
    init(view: InfoViewControllerProtocol) {
        self.view = view
    }
    
    func setRepository(repo: RepositoryModel) {
        self.infoRepository = repo
    }
    
    func getRepository() {
        self.view?.updateView(repo: infoRepository ?? RepositoryModel())
    }
    
    func openBrowserTapped(){
        self.view?.openBrowserWith(url: infoRepository?.repoOwner.url ?? "")
    }
}
