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
    @IBOutlet weak var currentCurrencyLabel: UILabel!
    @IBOutlet weak var currencySearchBar: UISearchBar!
    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet weak var assetsTableView: UITableView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    

    //MARK: - Properties
    static let segueIdentifier = "protfolioSegueIdentifier"
    private let currencyTableViewCellIdentifier = "currencyCell"
    private let presenter = PortfolioPresenter()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showNavigtionController()
    }
    
    //MARK: - Actions
    @IBAction func buyButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func sellButtonClicked(_ sender: UIButton) {
    }
    
    //MARK: - Methods
    private func configureScreen() {
        setButtonsStyle()
        presenter.delegate = self
        currentCurrencyLabel.text = presenter.getSelectedCurrencyString()
    }
    
    private func setButtonsStyle() {
        buyButton.layer.cornerRadius = 10
        sellButton.layer.cornerRadius = 10
    }
    
    private func hideNavigationController() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func showNavigtionController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: - Extensions
extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == currencyTableView {
            return presenter.currencyArrayLength
        } else {
            if presenter.summeriesArrayLength != 0 {
                return presenter.summeriesArrayLength
            } else {
                return 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == currencyTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: currencyTableViewCellIdentifier) else {
                return UITableViewCell()
            }
            cell.textLabel?.text = presenter.getCurrencyCodeString(for: indexPath.row)
            cell.detailTextLabel?.text = presenter.getCurrencySymbolString(for: indexPath.row)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension PortfolioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == currencyTableView {
            presenter.didSelectCurrencyRow(at: indexPath.row)
        }
    }
}

extension PortfolioViewController: PortfolioPresenterDelegate {
    func updateData() {
        currencyTableView.reloadData()
        assetsTableView.reloadData()
        currentCurrencyLabel.text = presenter.getSelectedCurrencyString()
    }
}

extension PortfolioViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.searchBarTextDidChange(to: searchText)
    }
}
