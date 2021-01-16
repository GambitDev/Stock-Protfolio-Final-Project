//
//  ExpandableHeaderFooterView.swift
//  Stock Portfolio Final Project
//
//  Created by Dan Gavrielov on 16/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import UIKit

protocol ExpandableHeaderFooterViewDelegate {
    func toggleSection(header: ExpandableHeaderFooterView, section: Int)
}

class ExpandableHeaderFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    private var delegate: ExpandableHeaderFooterViewDelegate?
    private var section: Int!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.textColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        contentView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderFooterView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func setHeaderFooterView(title: String, section: Int, delegate: ExpandableHeaderFooterViewDelegate) {
        textLabel?.text = title
        textLabel?.textAlignment = .right
        self.section = section
        self.delegate = delegate
    }
}
