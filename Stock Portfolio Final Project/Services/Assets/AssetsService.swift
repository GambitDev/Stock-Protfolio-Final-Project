//
//  AssetsService.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 05/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class AssetsService {
    
    //MARK: - Properties
    static let shared = AssetsService()
    private var assets = [Asset]()
    var assetSummeries = [AssetSummery]()
    
    //MARK: - Init
    private init() {
        if let path = Bundle.main.path(forResource: "stocks_names.list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                assets = try JSONDecoder().decode([Asset].self, from: data)
            } catch {
                print(error)
            }
        }
        AssetsSummeryService().getAssetSummeries(for: assets) { summeries in
            self.assetSummeries = summeries
        }
    }
}
