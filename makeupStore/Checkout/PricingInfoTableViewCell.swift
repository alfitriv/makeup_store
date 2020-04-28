//
//  PricingInfoTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 26/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class PricingInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var totalDueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(makeup: [Makeup]) {
        let makeupPrices = makeup.map { $0.price }
        //let makeupInt = makeupPrices.map({Int($0 ?? "") ?? 0})
        //let totalPrice = makeupPrices.reduce("") { $0 + ($1 ?? "") }
        let nonNil = makeupPrices.compactMap { $0 }

        let totalPrice = nonNil.joined(separator: "+")
        
        if makeup.count == 1 {
            totalDueLabel.text = makeup.first?.price
        } else {
            totalDueLabel.text = "$\(totalPrice)"
        }
    }
    
}
