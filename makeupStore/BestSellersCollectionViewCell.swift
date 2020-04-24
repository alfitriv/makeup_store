//
//  BestSellersCollectionViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 24/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import Kingfisher

class BestSellersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(makeup: Makeup) {
        let url = URL(string: makeup.imageLink ?? "")
        productImageView.kf.setImage(with: url)
        productCategory.text  = makeup.productType?.rawValue
        productBrand.text = makeup.brand
    }

}
