//
//  StringTests.swift
//  DataNormalizeTests
//
//  Created by Rohan Aurora on 2021-02-02.
//

import XCTest
@testable import DataNormalize

class StringTests: XCTestCase {

    var input: String!

    override func tearDown() {
        input = nil
        super.tearDown()
    }
    
    func testCapitalizeFirstLetter() {
        input = "hello"
        let validated = input.capitalizeFirstLetter
        let expected = "Hello"
        XCTAssertTrue(validated().caseInsensitiveCompare(expected) == .orderedSame, "Check first letter.")
    }
    
    func testLowercaseLetterWithCharacter() {
        input = "@hello"
        let validated = input.capitalizeFirstLetter
        let expected = "@Hello"
        XCTAssertTrue(validated().caseInsensitiveCompare(expected) == .orderedSame, "Check first letter.")
    }
    
    func testNumberAndUpperCase() {
        input = "23hELLO"
        let validated = input.capitalizeFirstLetter
        let expected = "23HELLO"
        XCTAssertTrue(validated().caseInsensitiveCompare(expected) == .orderedSame, "Check first letter.")
    }
}
