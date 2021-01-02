//
//  LogInScreenPresenter.swift
//  Stock Protfolio Final Project
//
//  Created by Dan Gavrielov on 02/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class LogInScreenPresenter {
    
    //MARK: - Properties
    private let userDefaults = UserDefaults()
    private let userDefaultsUsernameKey = "username"
    private let userDefaultsPasswordKey = "password"
    
    //MARK: - Methods
    func registerNewUser(userName: String, password: String) {
        userDefaults.set(userName, forKey: userDefaultsUsernameKey)
        userDefaults.set(password, forKey: userDefaultsPasswordKey)
    }
}
