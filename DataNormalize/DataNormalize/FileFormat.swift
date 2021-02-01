//
//  FileFormat.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-01-30.
//

import Foundation

struct FileFormat {
    
    var department: String = ""
    var courseNumber: Int = 0
    var year: Int = 0
    var semester: String = ""
    
    init(dept: String, cn: Int, year: Int, sem: String) {
        self.department = dept
        self.courseNumber = cn
        self.year = year
        self.semester = sem
    }
}

//MARK: - Debug Description -

extension FileFormat: CustomDebugStringConvertible {
    var debugDescription: String {
        var description: String = ""
        
        description.append(String(format:"Department: %@ \n", department))
        description.append(String(format:"Course Number: %d \n", courseNumber))
        description.append(String(format:"Year: %d \n", year))
        description.append(String(format:"Semester: %@ \n", semester))
        
        return description
    }
}
