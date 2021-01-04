//
//  CurrencyService.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 04/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class CurrencyService {
    
    //MARK: - Properties
    static let shared = CurrencyService()
    private let userDefaults = UserDefaults()
    private let userDefaultsCurrencyCodeKey = "currency_code"
//    var currencySymbols: CurrencySymbols? = nil
    var currencies = [Currency]()
    var selectedCurrency = Currency(code: "USA", symbol: "$")
    
    //MARK: - Init
    private init() {
        if let path = Bundle.main.path(forResource: "currency_symbols", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                currencies = try JSONDecoder().decode([Currency].self, from: data)
            } catch {
                print(error)
            }
        }
        if let savedCurrencyCode = userDefaults.string(forKey: userDefaultsCurrencyCodeKey) {
            changeCurrency(to: savedCurrencyCode)
        }
    }
    
    //MARK: - Methods
    func changeCurrency(to code: String) {
        guard let newCurrency = currencies.first(where: {$0.code == code}) else { return }
        selectedCurrency = newCurrency
        userDefaults.set(code, forKey: userDefaultsCurrencyCodeKey)
    }
}
