//
//  Store.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-02.
//

import UIKit

struct Store {
    static let shared = Store()
    var cache: [String] = []

    init() { }
    
    func isUserEnrolled(_ course: String) -> Bool {
        if cache.contains(course) {
            return true
        }
        return false
    }
}
