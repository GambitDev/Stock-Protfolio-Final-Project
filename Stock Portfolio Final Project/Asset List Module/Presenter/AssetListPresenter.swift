//
//  AssetListPresenter.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 16/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

class AssetListPresenter{
    
    //MARK: - Properties
    private let assetsService = AssetsService.shared
    var sections = [Section]()
    var filteredSections = [Section]()
    
    //MARK: - Init
    init() {
        let industryDictionary = createIndustryDictionary()
        populateSections(from: industryDictionary)
        filteredSections = sections
        sortSectionsAndUpdateData()
    }
    
    //MARK: - Methods
    private func createIndustryDictionary() -> [String: [AssetSummery]] {
        var dict = [String: [AssetSummery]]()
        for asset in assetsService.assetSummeries{
            if !dict.contains(where: {$0.key == asset.summaryProfile.industry}) {
                dict[asset.summaryProfile.industry] = [asset]
            } else {
                dict[asset.summaryProfile.industry]! += [asset]
            }
        }
        return dict
    }
    
    private func populateSections(from dict: [String: [AssetSummery]]) {
        for element in dict {
            sections.append(Section(industry: element.key, assets: element.value, expanded: false))
        }
    }
    
    private func sortSectionsAndUpdateData() {
        filteredSections.sort(by: {$0.industry < $1.industry})
    }
}
