//
//  NewArrivalCollectionViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 24/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import Kingfisher

class NewArrivalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.image = UIImage(named: "undraw_makeup_artist")
        
    }
    
    func configure(viewModel: NewArrivalsViewModel) {
        productImageView.kf.setImage(with: viewModel.imageUrl)
        
        brandName.text = viewModel.brandName
        productTypeLabel.text = viewModel.productTypeLabel
    }

}
