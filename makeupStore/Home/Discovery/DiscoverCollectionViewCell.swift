//
//  DiscoverCollectionViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 23/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }
    
    func configure(viewModel: DiscoverViewModel) {
        textLabel.text = viewModel.textLabel
    }

}
