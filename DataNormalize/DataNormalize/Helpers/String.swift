//
//  String.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-02.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
}
