//
//  BestSellersTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 24/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

protocol BestSellersTableViewCellDelegate: class {
    func bestSellersTableViewCell(_ cell: BestSellersTableViewCell, didSelect makeup: Makeup)
}

class BestSellersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: BestSellersTableViewCellDelegate?
    
    var bestSellers: [Makeup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "BestSellersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSeller")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BestSellersTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as! BestSellersCollectionViewCell
        let bestSeller = bestSellers?[indexPath.item] ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "")
        cell.setupCell(makeup: bestSeller)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 400, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bestSeller = bestSellers?[indexPath.item] ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: "")
        delegate?.bestSellersTableViewCell(self, didSelect: bestSeller)
        
    }
}
