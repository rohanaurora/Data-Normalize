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
    @IBOutlet weak var validateButton: UIButton!
    var s = Store()
    var newC :String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        textField.delegate = self
        textField.placeholder = Constants.filePlaceholder
        navigationItem.title = Constants.mainTitle
        outputLabel.text = ""
    }
}

// MARK: Display

extension MainVC {
    private func validateUserInput(_ enroll: Bool) {
        let input = textField.text ?? ""
        var v = Validate(input: input)
    
        if enroll {
            let _ = v.displayOutput(enroll)
            newC = v.courseNameNumber
        }
        
        let enroll: Bool = s.isUserEnrolled(newC)
        if enroll {
            outputLabel.text = v.displayOutput() + "\nYou have already been enrolled."
        } else {
            s.cache.append(newC)
            outputLabel.text = v.displayOutput()
        }
    }
}

// MARK: Actions

extension MainVC  {
    @IBAction func validateButtonTapped(_ sender: Any) {
        validateUserInput(false)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validateUserInput(true)
        return true
    }
}
