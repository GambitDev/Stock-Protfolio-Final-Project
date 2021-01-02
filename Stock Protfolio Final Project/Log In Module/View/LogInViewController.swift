//
//  ViewController.swift
//  Stock Protfolio Final Project
//
//  Created by Dan Gavrielov on 02/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    //MARK: - Properties

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePage()
    }
    
    //MARK: - Methods
    private func configurePage() {
        setButtonsStyle()
    }
    
    private func setButtonsStyle() {
        logInButton.layer.cornerRadius = logInButton.bounds.height / 2
        registerButton.layer.cornerRadius = registerButton.bounds.height / 2
    }
    
    //MARK: System Methods
}

