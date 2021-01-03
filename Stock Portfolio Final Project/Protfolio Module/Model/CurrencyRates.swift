//
//  CurrencyRates.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 03/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

struct CurrencyRates: Codable {
    let status, formula: String
    let currencyRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case status, formula
        case currencyRates = "currency_rates"
    }
}
