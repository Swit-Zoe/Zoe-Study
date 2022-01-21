//
//  ViewController.swift
//  UIKeyCommand-Practice
//
//  Created by Zoe on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: @IBOutlet Properties
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFirstResponder()
        initKeyCommands()
        assignDelegation()
    }
    
    // MARK: - Functions
    
    // init functions
    private func initFirstResponder() {
        textField.becomeFirstResponder()
    }
    
    private func initKeyCommands() {
        KeyCommands.allCases.forEach { keyCommand in
            addKeyCommand(keyCommand.command)
        }
    }
    
    func assignDelegation() {
        textField.delegate = self
    }

    // action functions
    @objc func inputESC() {
        testLabel.text = "ESC key clicked."
    }
    
    @objc func inputESC2() {
        testLabel.text = "ESC2 key clicked."
    }
    
    @objc func dummySelector() {
        print("Pressed")
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        testLabel.text = textField.text
        return true
    }
}
