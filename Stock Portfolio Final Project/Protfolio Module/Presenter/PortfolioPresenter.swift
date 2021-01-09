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
    var delegate: PortfolioPresenterDelegate?
    
    //currency properties
    private let currencyService = CurrencyService.shared
    var displayedCurrencies = [Currency]()
    var currencyArrayLength: Int {
        get {
            displayedCurrencies.count
        }
    }
    
    //assets properties
    private let assetsService = AssetsService.shared
    var assetSummeries = [AssetSummery]()
    var summeriesArrayLength: Int {
        get {
            assetSummeries.count
        }
    }
    
    //MARK: - Init
    init() {
        displayedCurrencies = currencyService.currencies
        assetSummeries = assetsService.assetSummeries
    }
    
    //MARK: - Methods
    func getSelectedCurrencyString() -> String {
        "\(currencyService.selectedCurrency.code) (\(currencyService.selectedCurrency.symbol))"
    }
    
    func getCurrencyCodeString(for index: Int) -> String {
        "Currency code - \(displayedCurrencies[index].code)"
    }
    
    func getCurrencySymbolString(for index: Int) -> String {
        "Symbol - \(displayedCurrencies[index].symbol)"
    }
    
    func didSelectCurrencyRow(at index: Int) {
        changeCurrency(to: displayedCurrencies[index].code)
    }
    
    func changeCurrency(to code: String) {
        currencyService.changeCurrency(to: code)
        delegate?.updateData()
    }
    
    func searchBarTextDidChange(to text: String) {
        if text.isEmpty {
            displayedCurrencies = currencyService.currencies
        } else {
            displayedCurrencies = currencyService.currencies.filter {
                $0.code.lowercased().contains(text.lowercased())
            }
        }
        delegate?.updateData()
    }
}
