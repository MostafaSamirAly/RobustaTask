//
//  TableViewControllerPresenterProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol TableViewControllerPresenterProtocol {
    func fetchRepositories()
    func getRepositoriesCount()->Int
    func getRepository(at indexPath:IndexPath)->RepositoryModel
}
