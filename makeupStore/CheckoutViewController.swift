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
    var checkoutItems: [Makeup] = []
    var makeupList: [Makeup]?
    var sections: [CheckoutSections] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            CheckoutSections.orderItems,
            CheckoutSections.itemSuggestion,
            CheckoutSections.pricingInfo
        ]
        
        tableView.register(UINib(nibName: "OrderItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItems")
        tableView.register(UINib(nibName: "ItemSuggestionTableViewCell", bundle: nil), forCellReuseIdentifier: "Suggestion")
        tableView.register(UINib(nibName: "PricingInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "PricingInfo")
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.estimatedRowHeight = 300

    }

}

extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]

        switch section {
        case .orderItems:
            return 1
        case .itemSuggestion:
            return 1
        case .pricingInfo:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .orderItems:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItems", for: indexPath) as! OrderItemsTableViewCell
            cell.orderItems = checkoutItems
            return cell
        case .itemSuggestion:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Suggestion", for: indexPath) as! ItemSuggestionTableViewCell
            let checkoutBrand = checkoutItems.first?.brand
            let listOfSuggestions = makeupList?.filter { $0.brand == checkoutBrand }
            cell.makeupList = listOfSuggestions
            cell.delegate = self
            return cell
        case .pricingInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PricingInfo", for: indexPath) as! PricingInfoTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        
        switch section {
        case .orderItems:
            return UITableView.automaticDimension + CGFloat(checkoutItems.count * 100)
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 16, y: 16, width: 320, height: 24)
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        switch section {
        case .orderItems:
            myLabel.text = "Item(s)"
            return headerView
        case .itemSuggestion:
            myLabel.text = "Things You Might Like"
            return headerView
        case .pricingInfo:
            myLabel.text = "Your Bill"
            return headerView
        }
    }

}

extension CheckoutViewController: ItemSuggestionTableViewCellDelegate {
    func itemSuggestionTableViewCell(_ cell: ItemSuggestionTableViewCell, didAdd item: Makeup) {
        
//        let matchingItem = checkoutItems.filter { $0.id == item.id }.first!
//        let indexOfMatchingItem = checkoutItems.firstIndex(of: matchingItem)
//        checkoutItems[indexOfMatchingItem!] = item
        checkoutItems.append(item)
        tableView.reloadData()
    }
    
    
}
