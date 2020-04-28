//
//  NewArrivalsTableViewCell.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 24/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

protocol NewArrivalsTableViewCellDelegate: class {
    func newArrivalsTableViewCell(_ cell: NewArrivalsTableViewCell, didTap item: Makeup)
}

class NewArrivalsTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate : NewArrivalsTableViewCellDelegate?
    var makeupList: [Makeup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "NewArrivalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewArrival")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewArrivalsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        makeupList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewArrival", for: indexPath) as! NewArrivalCollectionViewCell
        let makeup = makeupList?[indexPath.item]
        cell.setupCellItem(makeup: makeup ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let makeup = makeupList?[indexPath.item] else {
            return
        }
        delegate?.newArrivalsTableViewCell(self, didTap: makeup)

    }
    
}
