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
        
        let stringPattern = "([A-Z]|[a-z])+"
        let numPattern = "([0-9])+"
        let resultArray: [String]? = matches(for: stringPattern, in: input)
        let numArray: [String]? = matches(for: numPattern, in: input)
        
        // Space
        if input.count > 0 && !input.contains(Constants.space) { return VError.separatorFailed.localizedDescription }

        // Format
        if resultArray!.count != 2 || numArray!.count != 2 { return VError.dataIsNil.localizedDescription }
        
        // Department
        guard let dept = resultArray?.first else { return VError.deptFailed.localizedDescription }
        
        // Course Number
        guard let cn = Int((numArray?.first)!) else { return VError.courseFailed.localizedDescription }
        
        // Semester
        guard let sem = resultArray?.last else { return VError.semFailed.localizedDescription }
        let semVariations: [String] = Semester.allCases.map { $0.rawValue }
        if !semVariations.contains(where: {$0.caseInsensitiveCompare(sem) == .orderedSame}) { return VError.semFailed.localizedDescription }

        // Year
        guard let year = Int((numArray?.last)!) else { return VError.yearFailed.localizedDescription }
        if !(00...99).contains(year) && !(2003...2022).contains(year)   {
            return VError.yearFailed.localizedDescription
        }
        
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
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("Invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

