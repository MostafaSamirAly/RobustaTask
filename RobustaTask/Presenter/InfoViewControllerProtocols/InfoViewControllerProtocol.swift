//
//  InfoViewControllerProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol InfoViewControllerProtocol: class{
    func updateView(repo:RepositoryModel)
    func openBrowserWith(url:String)
}
