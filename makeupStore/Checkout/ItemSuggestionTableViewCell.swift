//
//  ItemSuggestionTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 26/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

protocol ItemSuggestionTableViewCellDelegate: class {
    func itemSuggestionTableViewCell(_ cell: ItemSuggestionTableViewCell, didAdd item: Makeup)
}

class ItemSuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: ItemSuggestionTableViewCellDelegate?
    var makeupList: [Makeup]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "BestSellersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BestSeller")
        
    }
    
}

extension ItemSuggestionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return makeupList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as! BestSellersCollectionViewCell
        if let makeup = makeupList?[indexPath.item] {
            let viewModel = BestSellerViewModel(makeup: makeup)
            cell.configure(viewModel: viewModel)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = makeupList?[indexPath.item] {
            delegate?.itemSuggestionTableViewCell(self, didAdd: item)
        }
    }
    
}
