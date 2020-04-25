//
//  DetailImageTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 25/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import Kingfisher

class DetailImageTableViewCell: UITableViewCell {
    @IBOutlet weak var detailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(makeup: Makeup) {
        let image = URL(string: makeup.imageLink ?? "")
        detailImage.kf.setImage(with: image)
    }
    
}
