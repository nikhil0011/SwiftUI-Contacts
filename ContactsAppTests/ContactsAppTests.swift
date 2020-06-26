//
//  ContactsAppTests.swift
//  ContactsAppTests
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import XCTest
@testable import ContactsApp

class ContactsAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testUserName() {
        let user = User(userId: 576890, firstname: nil, lastName: nil, profilePic: "vhjbnk", favorite: false)
        XCTAssertNotNil(user.userName)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
