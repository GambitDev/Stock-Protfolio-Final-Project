//
//  PortfolioViewController.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 02/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var changeInAssetsValueImageView: UIImageView!
    @IBOutlet weak var currencySearchBar: UISearchBar!
    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet weak var assetsTableView: UITableView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    

    //MARK: - Properties
    static let segueIdentifier = "protfolioSegueIdentifier"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
    }
    
    //MARK: - Actions
    @IBAction func buyButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func sellButtonClicked(_ sender: UIButton) {
    }
    
    //MARK: - Methods
    private func configureScreen() {
        setButtonsStyle()
    }
    
    private func setButtonsStyle() {
        buyButton.layer.cornerRadius = 10
        sellButton.layer.cornerRadius = 10
    }
}
