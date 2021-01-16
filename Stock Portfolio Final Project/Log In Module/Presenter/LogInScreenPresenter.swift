//
//  LogInScreenPresenter.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 02/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

protocol LogInPresenterDelegate {
    func noUserExist()
    func loginSuccessful()
    func loginFailed()
}

class LogInScreenPresenter {
    
    //MARK: - Properties
    private let userDefaults = UserDefaults()
    var delegate: LogInPresenterDelegate?
    private let userDefaultsUsernameKey = "username"
    private let userDefaultsPasswordKey = "password"
    
    //MARK: - Methods
    func registerNewUser(userName: String, password: String) {
        userDefaults.set(userName, forKey: userDefaultsUsernameKey)
        userDefaults.set(password, forKey: userDefaultsPasswordKey)
    }
    
    func login(userName: String, password: String) {
        guard let savedUserName = userDefaults.string(forKey: userDefaultsUsernameKey),
            let savedPassword = userDefaults.string(forKey: userDefaultsPasswordKey) else {
                delegate?.noUserExist()
                return
        }
        if savedUserName == userName && savedPassword == password {
            delegate?.loginSuccessful()
        } else {
            delegate?.loginFailed()
        }
    }
}
