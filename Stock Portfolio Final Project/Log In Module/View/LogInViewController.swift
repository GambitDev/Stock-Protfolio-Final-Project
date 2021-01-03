//
//  LogInViewController.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 02/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - Properties
    private let presenter = LogInScreenPresenter()
    let alertController = UIAlertController(title: "Register A New Account", message: nil, preferredStyle: .alert)

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicatorView.alpha = 0
    }
    
    //MARK: - Actions
    @IBAction func logInButtonClicked(_ sender: UIButton) {
        guard let userName = usernameTextField.text, let password = passwordTextField.text else { return }
        if userName.isEmpty || password.isEmpty {
            showErrorAlertController(with: "Please enter a valid username and password.")
            return
        }
        presenter.login(userName: userName, password: password)
    }
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        showRegisterAlertController()
    }
    
    //MARK: - Methods
    private func configurePage() {
        presenter.delegate = self
        setButtonsStyle()
        activityIndicatorView.alpha = 0
    }
    
    private func setButtonsStyle() {
        logInButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
    }
    
    private func showRegisterAlertController() {
        
        let registerAction = UIAlertAction(title: "Register An Account", style: .default) { [weak self] action in
            guard let username = self?.alertController.textFields?[0].text, let password = self?.alertController.textFields?[1].text else { return }
            self?.presenter.registerNewUser(userName: username, password: password)
        }
        
        alertController.addTextField() { [weak self] textField in
            textField.placeholder = "Username"
            textField.addTarget(self, action: #selector(self?.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        
        alertController.addTextField() { [weak self] textField in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            textField.addTarget(self, action: #selector(self?.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        
        registerAction.isEnabled = false
        alertController.addAction(registerAction)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func showErrorAlertController(with message: String) {
        let alertController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func alertTextFieldDidChange(_ sender: UITextField) {
        guard let isUsernameFieldEmpty = alertController.textFields?[0].text?.isEmpty, let isPasswordFieldEmpty = alertController.textFields?[1].text?.isEmpty else { return }
        alertController.actions[0].isEnabled = !isUsernameFieldEmpty && !isPasswordFieldEmpty
    }
    
    //MARK: System Methods
}

//MARK: - Extensions
extension LogInViewController: LogInPresenterDelegate {
    func noUserExist() {
        showErrorAlertController(with: "Looks like there is no registered account yet.")
    }
    
    func loginSuccessful() {
        activityIndicatorView.alpha = 1
        performSegue(withIdentifier: PortfolioViewController.segueIdentifier, sender: self)
    }
    
    func loginFailed() {
        showErrorAlertController(with: "Username or password seems to be incorrect.")
    }
}
