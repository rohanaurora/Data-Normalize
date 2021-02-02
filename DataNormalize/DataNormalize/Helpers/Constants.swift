//
//  Constants.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-01.
//

import Foundation

enum Semester: String, CaseIterable {
    case f, fall,
         w, winter,
         s, spring,
         su, summer
    
    var desc: String {
        switch self {
        case .fall, .f:
            return Semester.fall.rawValue.capitalizeFirstLetter()
        case .w, .winter:
            return Semester.winter.rawValue.capitalizeFirstLetter()
        case .spring, .s:
            return Semester.spring.rawValue.capitalizeFirstLetter()
        case .su, .summer:
            return Semester.summer.rawValue.capitalizeFirstLetter()
        }
    }
}

struct Constants {
    static let space: String = " "
    static let mainTitle: String = "Data Normalization"
    static let filePlaceholder: String = "e.g. CS111 Fall 2016"
    static let wordPattern = "([A-Z]|[a-z])+"
    static let numPattern = "([0-9])+"
    static let separatorPattern = "(\\s)(Fall|f|F|fall|Summer|Su|su|summer|W|Winter|w|winter|Spring|spring|s|S)"
}
