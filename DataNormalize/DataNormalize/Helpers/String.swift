//
//  String.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-02.
//

import Foundation

extension String {
    
/// String extension that capitalizes the first letter.
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
}
