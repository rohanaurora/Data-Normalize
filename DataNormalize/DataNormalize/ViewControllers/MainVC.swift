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

extension MainVC {
    private func validateUserInput() {
        let input = textField.text ?? ""
        let v = Validate(input: input)
        outputLabel.text = v.displayOutput()
    }
}

// MARK: - Actions
extension MainVC  {
    @IBAction func validateButtonTapped(_ sender: Any) {
        validateUserInput()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validateUserInput()
        return true
    }
}
