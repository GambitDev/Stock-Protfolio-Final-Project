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
    var currencySymbols: CurrencySymbols? = nil
    var selectedCurrency: (code: String, symbol: String) = ("USA","$")
    
    //MARK: - Init
    private init() {
        if let path = Bundle.main.path(forResource: "currency_symbols", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                currencySymbols = try JSONDecoder().decode(CurrencySymbols.self, from: data)
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
        guard let currencySymbols = currencySymbols else { return }
        selectedCurrency.code = currencySymbols.symbols.keys.first(where: {$0 == code})!
        selectedCurrency.symbol = currencySymbols.symbols[code]!
        userDefaults.set(code, forKey: userDefaultsCurrencyCodeKey)
    }
}
