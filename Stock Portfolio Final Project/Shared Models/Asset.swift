//
//  Asset.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 05/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

struct Asset: Codable {
    let symbol, company: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "Symbol"
        case company = "Company"
    }
}
