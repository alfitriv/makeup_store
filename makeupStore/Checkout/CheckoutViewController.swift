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
    @IBOutlet weak var checkoutButton: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        
        self.navigationItem.title = "Checkout"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        checkoutButton.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(submitOrder))
        checkoutButton.addGestureRecognizer(tap)
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()

    }
    
    @objc func submitOrder() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
            let successVC = PurchaseSuccessViewController.init(nibName: "PurchaseSuccessViewController", bundle: nil)
            successVC.modalPresentationStyle = .currentContext
        successVC.delegate = self
            self.present(successVC, animated: true, completion: nil)
        }
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
            
            cell.setupCell(makeup: checkoutItems)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        
        switch section {
        case .orderItems:
            return UITableView.automaticDimension + CGFloat(checkoutItems.count * 100)
        case .pricingInfo:
            return UITableView.automaticDimension
        case .itemSuggestion:
            return 180
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 16, y: -8, width: 320, height: 24)
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

extension CheckoutViewController: PurchaseSuccessViewControllerDelegate {
    func purchaseSuccessViewController(_ class: PurchaseSuccessViewController, didDismiss _: Bool) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
