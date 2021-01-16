//
//  UserAssetTableViewCell.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 16/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class UserAssetTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var totalWorthLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier = "assetCell"
    
    //MARK: - Methods
    func configureCell() {
        
    }
    
    func configureEmptyPortfolioCell() {
        assetSymbolLabel.text = "You currently have no assets!"
        amountLabel.text = ""
        totalWorthLabel.text = ""
    }
}
