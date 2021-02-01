//
//  MainVC.swift
//  DataNormalize
//
//  Created by Rohan Aurora on 2021-01-30.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        textField.delegate = self
        textField.placeholder = "Enter the course. Example: CS111 2016 Fall"
        navigationItem.title = "Data Normalization"
        outputLabel.text = ""
    }
}

extension MainVC {
    private func validate() {
        let input = textField.text
//        CS111 2016 Fall
//            . A department is always one or more alphabetic characters, and a course number is always one or more numeric characters. Semester is either an abbreviation or a word, and a Year is either two digits or four digits. Semester and Year can be swapped in position. There is always a space between Department+Course Number and Semester+Year.

        do {
            try parseInput(input)
        } catch {
            print("Check input!")
        }
    }
    
    func parseInput(_ input: String?) {
        let course = input ?? ""
        let stringPattern = "([A-Z]|[a-z])+"
        let numPattern = "([0-9])+"
        let resultArray: [String]? = matches(for: stringPattern, in: course)
        let numArray: [String]? = matches(for: numPattern, in: course)
        
        if resultArray!.count <= 1 { return } // Show Error
        guard let dept = resultArray?.first,
              let cn = Int((numArray?.first)!),
              let year = Int((numArray?[1])!),
              let sem = resultArray?[1]
        else { return }

        let file = FileFormat(dept: dept, cn: cn, year: year, sem: sem)
        outputLabel.text = file.debugDescription
    }
    
    func matches(for regex: String, in text: String) -> [String]? {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

extension MainVC  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validate()
        return true
    }
}
