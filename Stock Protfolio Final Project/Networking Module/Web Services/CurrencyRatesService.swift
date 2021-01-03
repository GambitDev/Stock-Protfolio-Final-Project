//
//  CurrencyRatesService.swift
//  Stock Protfolio Final Project
//
//  Created by Dan Gavrielov on 03/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class CurrencyRatesService {
    
    func getCurrencies(completion: @escaping (CurrencyRates) -> ()) {
        guard let url = NSURL(string: "https://currency-value.p.rapidapi.com/global/currency_rates") else {
            print("Error creating url object")
            return
        }
        
        let request = NSMutableURLRequest(url: url as URL,
            cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0)
        
        let headers = [
            "x-rapidapi-key": "b187cb060dmsh50733daeee4b01ap191085jsnce47dc9eb29f",
            "x-rapidapi-host": "currency-value.p.rapidapi.com"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            if error != nil {
                print(error as Any)
            } else {
                if let data = data {
                    do {
                        let currency = try JSONDecoder().decode(CurrencyRates.self, from: data)
                        DispatchQueue.main.async {
                            completion(currency)
                        }
                    } catch {
                        print("Error parsing data!")
                    }
                }
            }
        }.resume()
    }
    
//    private func jsonObjectToString(from jsonObject: Any) -> String {
//        do {
//            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
//            let convertedString = String(data: data, encoding: String.Encoding.utf8) ?? ""
//            return convertedString
//        } catch {
//            print(error)
//        }
//
//        return "N/A"
//    }
}
