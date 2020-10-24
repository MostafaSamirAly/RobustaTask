//
//  RobustaTaskTests.swift
//  RobustaTaskTests
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import XCTest
@testable import RobustaTask

class ReposPresenterTest: XCTestCase {

    var presenter: ReposTableViewControllerPresenterProtocol!
    
    override func setUp() {
        let view = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(identifier: "ReposTableViewController")
                as! ReposTableViewController
        UIApplication.shared.keyWindow?.rootViewController = view
        presenter = ReposTableViewControllerPresenter(view: view)
    }
    
    func testPresenterFetching() {

        XCTAssertNil(presenter.displayRepositories)
        presenter.fetchRepositories()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            XCTAssertEqual(self.presenter.displayRepositories?.count, 10)
            self.presenter.displayMore()
            XCTAssertEqual(self.presenter.displayRepositories?.count, 10)
        }
        
        
        
    }
}
