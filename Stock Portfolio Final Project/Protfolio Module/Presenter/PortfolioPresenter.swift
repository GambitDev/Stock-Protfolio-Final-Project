//
//  PortfolioPresenter.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 04/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

protocol PortfolioPresenterDelegate {
    func updateData()
}

class PortfolioPresenter {
    
    //MARK: - Properties
    private let currencyService = CurrencyService.shared
    var delegate: PortfolioPresenterDelegate?
    var currencyArrayLength: Int {
        get {
            currencyService.currencies.count
        }
    }
    
    //MARK: - Methods
    func getSelectedCurrencyString() -> String {
        "\(currencyService.selectedCurrency.code) (\(currencyService.selectedCurrency.symbol))"
    }
    
    func getCurrencyCodeString(for index: Int) -> String {
        "Currency code - \(currencyService.currencies[index].code)"
    }
    
    func getCurrencySymbolString(for index: Int) -> String {
        "Symbol - \(currencyService.currencies[index].symbol)"
    }
    
    func didSelectCurrencyRow(at index: Int) {
        changeCurrency(to: currencyService.currencies[index].code)
    }
    
    func changeCurrency(to code: String) {
        currencyService.changeCurrency(to: code)
        delegate?.updateData()
    }
}
