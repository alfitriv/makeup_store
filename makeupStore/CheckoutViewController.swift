//
//  CheckoutViewController.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 25/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

enum CheckoutSections {
    case orderItems
    case itemSuggestion
    case pricingInfo
}

class CheckoutViewController: UIViewController {
    //var checkoutItems: [Makeup]?
    var sections: [CheckoutSections] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            CheckoutSections.orderItems,
            CheckoutSections.itemSuggestion,
            CheckoutSections.pricingInfo
        ]
        
        tableView.tableFooterView = UIView(frame: .zero)

    }

}

extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.row]
        
        switch section {
        case .orderItems:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! UITableViewCell
            return cell
        case .itemSuggestion:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as!  UITableViewCell
            return cell
        case .pricingInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! UITableViewCell
            return cell
        }
    }
    
    
}
