//
//  InfoViewControllerPresenterProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol InfoViewControllerPresenterProtocol {
    func setRepository(repo:RepositoryModel)
    func getRepository()
    func openBrowserTapped()
}
