//
//  TableViewControllerProtocol.swift
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import Foundation

protocol TableViewControllerProtocol: class {
    func reloadView()
    func showError(error:Error)
}
