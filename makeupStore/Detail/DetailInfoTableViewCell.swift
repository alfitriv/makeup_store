//
//  DetailInfoTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 25/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class DetailInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(makeup: Makeup) {
        brandName.text = makeup.brand?.uppercased()
        productName.text = makeup.productType?.rawValue
        if let price = makeup.price {
            productPrice.text = "$\(price)"
        }
    }
    
}
