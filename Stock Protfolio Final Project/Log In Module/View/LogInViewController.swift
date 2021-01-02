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
    private let presenter = LogInScreenPresenter()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePage()
    }
    
    //MARK: - Actions
    @IBAction func logInButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        showRegisterAlertController()
    }
    
    //MARK: - Methods
    private func configurePage() {
        setButtonsStyle()
    }
    
    private func setButtonsStyle() {
        logInButton.layer.cornerRadius = logInButton.bounds.height / 2
        registerButton.layer.cornerRadius = registerButton.bounds.height / 2
    }
    
    private func showRegisterAlertController() {
        
        let alertController = UIAlertController(title: "Register A New Account", message: nil, preferredStyle: .alert)
        
        alertController.addTextField() { textField in
            textField.placeholder = "Username"
        }
        
        alertController.addTextField() { textField in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(UIAlertAction(title: "Register An Account", style: .default) { [weak self] action in
            guard let username = alertController.textFields?[0].text, let password = alertController.textFields?[1].text else {
                return
            }
            self?.presenter.registerNewUser(userName: username, password: password)
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: System Methods
}

