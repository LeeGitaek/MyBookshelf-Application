//
//  Sendbird_AssignmentTests.swift
//  Sendbird-AssignmentTests
//
//  Created by gitaeklee on 2021/02/25.
//

import XCTest
@testable import Sendbird_Assignment

class Sendbird_AssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testBookAPI () {
        let bookUrl = "https://api.itbook.store/1.0/search/swift/1"
        let encoded = bookUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let bookStoreURL = URL(string: encoded!)
        var request = URLRequest(url: bookStoreURL!)
       
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
        //    guard let data = data, error == nil else { return }
            guard let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 else { return }
            XCTAssertEqual(httpStatus.statusCode, 200)
            if httpStatus.statusCode != 200 {
                XCTFail("Status code: \(httpStatus.statusCode)")
            }
        }.resume()
    }
    
    func testDetailInfo() {
        let bookUrl = "https://api.itbook.store/1.0/books/9780983066989"
        let encoded = bookUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let bookStoreURL = URL(string: encoded!)
        var request = URLRequest(url: bookStoreURL!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 else { return }
            XCTAssertEqual(httpStatus.statusCode, 200)
            if httpStatus.statusCode != 200 {
                XCTFail("Status code: \(httpStatus.statusCode)")
            }
            
        }.resume()
    }
    
    
   
    
    
}
