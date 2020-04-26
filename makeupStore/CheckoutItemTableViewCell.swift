//
//  CheckoutItemTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 26/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import Kingfisher

class CheckoutItemTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
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
        productName.text = makeup.name
        
        if let makeupPrice = makeup.price {
             productPrice.text = "$\(makeupPrice)"
        }
        
        let url = URL(string: makeup.imageLink ?? "")
        productImage.kf.setImage(with: url)
    }
    
}
