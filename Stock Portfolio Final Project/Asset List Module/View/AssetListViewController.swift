//
//  AssetListViewController.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 16/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

class AssetListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var industrySearchBar: UISearchBar!
    @IBOutlet weak var assetsTableView: UITableView!
    
    //MARK: - Properties
    private let presenter = AssetListPresenter()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePage()
    }
    
    //MARK: - Methods
    private func configurePage() {
        configurNavigationBar()
        configureTableView()
    }
    
    private func configurNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func configureTableView() {
        assetsTableView.tableFooterView = UIView()
    }
}

//MARK: - Extensions
