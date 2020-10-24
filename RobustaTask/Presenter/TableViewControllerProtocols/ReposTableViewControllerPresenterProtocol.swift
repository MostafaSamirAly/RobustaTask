//
//  TableViewControllerPresenterProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol ReposTableViewControllerPresenterProtocol {
    func fetchRepositories()
    func displayMore()
    func didSelectItem(at indexPath:IndexPath)
    func resetData()
    var displayRepositories: [RepositoryModel]? { get }
}
