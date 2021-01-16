//
//  AssetsSummeryService.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 05/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class AssetsSummeryService {
    
    let urlString = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=<asset_symbol>&region=US"
    
    func getAssetSummeries(for assets: [Asset], completion: @escaping ([AssetSummery]) -> ()) {
        for asset in assets {
            if let url = URL(string: urlString.replacingOccurrences(of: "<asset_symbol>", with: asset.symbol)) {
                let request = NSMutableURLRequest(url: url,
                                                  cachePolicy: .useProtocolCachePolicy,
                                                  timeoutInterval: 60.0)
                
                let headers = [
                    "x-rapidapi-key": "b187cb060dmsh50733daeee4b01ap191085jsnce47dc9eb29f",
                    "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
                ]
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers
                
                URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
                    if error != nil {
                        print(error as Any)
                    } else {
                        if let data = data {
                            do {
                                let assetSummeries = try JSONDecoder().decode([AssetSummery].self, from: data)
                                DispatchQueue.main.async {
                                    completion(assetSummeries)
                                }
                            } catch {
                                print("Error parsing data!")
                            }
                        }
                    }
                }.resume()
            }
        }
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
