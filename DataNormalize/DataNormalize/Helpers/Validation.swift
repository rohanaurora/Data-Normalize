//
//  Validation.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-02-01.
//

import Foundation

struct Validate {
    let input: String
    
    private func parseInput() throws -> String {
        
        let wordArray = matches(for: Constants.wordPattern, in: input)
        let numArray = matches(for: Constants.numPattern, in: input)
        let spaceMatches = matches(for: Constants.separatorPattern, in: input)
        
        // Space
        if spaceMatches?.count == 0 || input.count > 0 && !input.contains(Constants.space)  { return VError.separatorFailed.localizedDescription }
        
        // Format
        if wordArray!.count != 2 || numArray!.count != 2 { return VError.dataIsNil.localizedDescription }
        
        // Department
        guard let dept = wordArray?.first else { return VError.deptFailed.localizedDescription }
        
        // Course Number
        guard let cn = Int((numArray?.first)!) else { return VError.courseFailed.localizedDescription }
        
        // Semester
        guard var sem = wordArray?.last else { return VError.semFailed.localizedDescription }
        sem = sem.lowercased()
        let semVariations: [String] = Semester.allCases.map { $0.rawValue }
        if !semVariations.contains(sem) { return VError.semFailed.localizedDescription }
        
        // Year
        guard var year = Int((numArray?.last)!) else { return VError.yearFailed.localizedDescription }
        if (0...25).contains(year) { year += 2000 }
        if !(2000...2025).contains(year) { return VError.yearFailed.localizedDescription }
        
        let file = FileFormat(dept: dept, cn: cn, year: year, sem: sem)
        return file.debugDescription
    }
    
    public func displayOutput() -> String {
        do {
            let str = try parseInput()
            return str
        } catch {
            return("Please try again later.")
        }
    }
    
    private func matches(for regex: String, in text: String) -> [String]? {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("Invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

