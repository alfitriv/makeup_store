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
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.borderColor = CGColor(srgbRed: 254/255, green: 184/255, blue: 198/255, alpha: 1)
        self.layer.cornerRadius = 12
    }
    
    func setupCell(makeup: Makeup) {
        let url = URL(string: makeup.imageLink ?? "")
        productImageView.kf.setImage(with: url)
        productCategory.text  = makeup.productType?.rawValue
        productBrand.text = makeup.brand
    }

}
