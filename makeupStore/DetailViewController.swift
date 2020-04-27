//
//  DetailViewController.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 25/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

enum DetailSection {
    case image
    case info
    case description
}

class DetailViewController: UIViewController {
    var makeup: Makeup?
    var makeupList: [Makeup]?
    var sections: [DetailSection] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToCartView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            DetailSection.image,
            DetailSection.info,
            DetailSection.description
        ]
        
        tableView.register(UINib(nibName: "DetailImageTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailImage")
        tableView.register(UINib(nibName: "DetailInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailInfo")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "Description")
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.estimatedRowHeight = 300
        
        self.navigationItem.title = "Overview"
        
        addToCartView.layer.cornerRadius = 8
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        addToCartView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap() {
        let checkoutVC = CheckoutViewController.init(nibName: "CheckoutViewController", bundle: nil)
        if let makeup = makeup {
            checkoutVC.checkoutItems.append(makeup)
            checkoutVC.makeupList = makeupList
        }
        
        self.navigationController?.pushViewController(checkoutVC, animated: true)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.row]

        switch section {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImage", for: indexPath) as! DetailImageTableViewCell
            cell.setupCell(makeup: makeup ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: ""))
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInfo", for: indexPath) as! DetailInfoTableViewCell
            cell.setupCell(makeup: makeup ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: ""))
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Description", for: indexPath) as! DescriptionTableViewCell
            cell.setupCell(makeup: makeup ?? Makeup(id: 0, brand: "", productType: .blush, imageLink: "", name: "", price: "", priceSign: "", description: ""))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.row]
        
        switch section {
        case .image:
            return 300
        case .description:
            return UITableView.automaticDimension
        default:
            return 100
        }
    }
    
}
