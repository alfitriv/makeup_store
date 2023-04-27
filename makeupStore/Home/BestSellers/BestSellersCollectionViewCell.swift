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
        self.layer.borderWidth = 6
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.borderColor = CGColor(srgbRed: 255/255, green: 207/255, blue: 220/255, alpha: 1)
        self.layer.cornerRadius = 12
    }
    
    func configure(viewModel: BestSellerViewModel) {
        productImageView.kf.setImage(with: viewModel.imageUrl)
        productCategory.text  = viewModel.makeupName
        productBrand.text = viewModel.makeupBrand
    }

}
