//
//  BrandCollectionViewController.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 27/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class BrandCollectionViewController: UIViewController {
    var makeupList: [Makeup]?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NewArrivalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandCell")
        
        if let makeupBrand = makeupList?.first?.brand {
            navigationItem.title = makeupBrand
        }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BrandCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return makeupList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as! NewArrivalCollectionViewCell
        if let makeup = makeupList?[indexPath.item] {
           cell.setupCellItem(makeup: makeup)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.layer.bounds.width/3
        
        return CGSize(width: itemWidth, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let makeup = makeupList?[indexPath.item]
        let detailVC = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
        detailVC.makeup = makeup
        detailVC.makeupList = makeupList
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
