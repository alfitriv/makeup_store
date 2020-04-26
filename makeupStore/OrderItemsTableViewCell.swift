//
//  OrderItemsTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 26/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class OrderItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    var orderItems: [Makeup]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib(nibName: "CheckoutItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutItem")
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension OrderItemsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutItem", for: indexPath) as! CheckoutItemTableViewCell
        let makeup = orderItems?[indexPath.row] ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: "")
        cell.setupCell(makeup: makeup)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension OrderItemsTableViewCell: ItemSuggestionTableViewCellDelegate {
    func itemSuggestionTableViewCell(_ cell: ItemSuggestionTableViewCell, didAdd item: Makeup) {
        orderItems?.append(item)
        tableView.reloadData()
    }
}
