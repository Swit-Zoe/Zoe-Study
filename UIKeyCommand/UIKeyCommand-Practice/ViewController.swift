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
    @IBOutlet weak var textView: UITextView!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initFirstResponder()
        initKeyCommands()
        assignDelegation()
        
    }
    
    // MARK: - Functions
    
    // init functions
    private func initUI() {
        testLabel.numberOfLines = 0
    }
    
    private func initFirstResponder() {
        textView.becomeFirstResponder()
    }
    
    private func initKeyCommands() {
        KeyCommands.allCases.forEach { keyCommand in
            addKeyCommand(keyCommand.command)
        }
    }
    
    func assignDelegation() {
        // textView.delegate = self
    }
    
    // action functions
    @objc func dummySelector() {
        print("Pressed")
    }

}

// MARK: - KeyCommandActionProtocol

extension ViewController: KeyCommandActionProtocol {
    func pressEnter() {
        testLabel.text = textView.text
        textView.text = ""
        print("Enter Pressed")
    }
    
    func pressNewLine() {
        textView.insertText("\n")
        print("New Line")
    }
    
}
