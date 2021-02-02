//
//  Errors.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-01.
//

import Foundation

/* A department is always one or more alphabetic characters, and a course number is always one or more numeric characters.
   Semester is either an abbreviation or a word, and a Year is either two digits or four digits.
   Semester and Year can be swapped in position.
   There is always a space between Department+Course Number and Semester+Year. */

enum VError: Error {
    case dataIsNil
    case deptFailed
    case courseFailed
    case yearFailed
    case semFailed
    case separatorFailed
}


//MARK: - Description -

extension VError {
    var localizedDescription: String {
        switch self {
        case .dataIsNil,
             .deptFailed,
             .courseFailed:
            return "Please enter valid department and course number to proceed. \n\n e.g. MATH 123 Fall 2021"
        case .yearFailed:
            return "Please use a valid year with two digits or four digits to proceed."
        case .semFailed:
            return "Please use a valid semester to proceed. \n\n e.g. MATH 123 Summer 2021 or MATH 123 Su2021"
        case .separatorFailed:
            return "Please use proper format with a space. \n\n e.g. MATH 123 Fall 2021"
        }
    }
}
