//
//  NetworkTest.swift
//  RobustaTaskTests
//
//  Created by Mostafa Samir on 10/24/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import XCTest
@testable import RobustaTask

class NetworkTest: XCTestCase {
    var fetcher: RepositoryFetcher!
    var parser: RepositoryParser!
    var data: Any!
    
    override func setUp() {
        parser = RepositoryParser()
        fetcher = RepositoryFetcher(parser: parser)
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "MockApi", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        data = try? JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as! NSArray
    }
    
    func testFetcher() {
        let promise = expectation(description: "Fetcher is fetching data")
        fetcher.fetchRepos(success: { (repositories) in
            if repositories.count == 100{
                promise.fulfill()
            }else{
                XCTFail("Response is not as Expected")
            }
        }) { error in
            XCTFail("Responded with error")
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testParser() {
        let promise = expectation(description: "Parsing Mock Data")
        parser.parseRepositories(data!, withSuccess: { (repositories) in
            if repositories.count == 3{
                promise.fulfill()
            }else{
                XCTFail("parsed is not as Expected")
            }
        }) { (error) in
            XCTFail("parsing  error")
        }
        wait(for: [promise], timeout: 5)
        
    }
}
