//
//  DataNormalizeTests.swift
//  DataNormalizeTests
//
//  Created by Rohan Aurora on 2021-01-30.
//

import XCTest
@testable import DataNormalize

class DataNormalizeTests: XCTestCase {

    var input: String!
    var validate: Validate!
    var formatter: FileFormat!

    override func tearDown() {
        validate = nil
        input = nil
        formatter = nil
        super.tearDown()
    }
    
    func testContainsEmptyString() {
        input = ""
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        let expected = VError.dataIsNil.localizedDescription
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsMissingCourseNumber() {
        input = "CS Fall 2003"
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        let expected = VError.dataIsNil.localizedDescription
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsIncorrectYear() {
        input = "CS401 Fall 13003"
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        let expected = VError.yearFailed.localizedDescription
        XCTAssertEqual(expected, validated)
    }
    
    func testContainsYearWithOneDigit() {
        input = "CS401 Fall 3"
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        let expected = VError.yearFailed.localizedDescription
        XCTAssertNotEqual(expected, validated)
    }
    
    func testContainsYearWithTwoDigits() {
        input = "CS401 Fall 21"
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        
        formatter = FileFormat(dept: "CS", cn: 401, year: 21, sem: "Fall")
        let expected = formatter!.debugDescription

        XCTAssertEqual(expected, validated)
    }
    
    func testContainsYearWithFourDigits() {
        input = "CS 401 Fall 2021"
        validate = Validate(input: input)
        let validated = validate.displayOutput()
        
        formatter = FileFormat(dept: "CS", cn: 401, year: 2021, sem: "Fall")
        let expected = formatter!.debugDescription

        XCTAssertEqual(expected, validated)
    }
}
