//
//  TableViewControllerProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol ReposTableViewControllerProtocol: class {
    func reloadView()
    func showError(error:Error)
    func navigateToInfoView(with repo:RepositoryModel)
}
