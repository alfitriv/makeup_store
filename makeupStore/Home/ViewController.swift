//
//  ViewController.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 23/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

enum HomeSections {
    case banner
    case discover
    case newArrivals
    case bestSellers
}

class ViewController: UIViewController {
    var networkLayer = NetworkLayer.shared
    var makeupList: [Makeup] = []
    var sections: [HomeSections] = []
    var brands: [String]?
    var chosenMakeup: Makeup? {
        didSet {
            let detailVC = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
            detailVC.makeup = chosenMakeup
            detailVC.makeupList = makeupList
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    var filteredBrand: [Makeup]? {
        didSet {
            let brandCollectionsVC = BrandCollectionViewController.init(nibName: "BrandCollectionViewController", bundle: nil)
            brandCollectionsVC.makeupList = filteredBrand
            self.navigationController?.pushViewController(brandCollectionsVC, animated: true)
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
        networkLayer.fetchMakeUpList { result in
            switch result {
            case .success(let makeup):
                self.makeupList = makeup
                let filteredBrands = self.makeupList.compactMap { $0.brand }
                self.brands = filteredBrands.removingDuplicates()
                self.progressIndicator.isHidden = true
                self.progressIndicator.stopAnimating()
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        sections = [
            HomeSections.banner,
            HomeSections.discover,
            HomeSections.newArrivals,
            HomeSections.bestSellers
        ]
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "Banner")
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "Discover")
        tableView.register(UINib(nibName: "NewArrivalsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewArrivals")
        tableView.register(UINib(nibName: "BestSellersTableViewCell", bundle: nil), forCellReuseIdentifier: "BestSellers")
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .banner:
            return 1
        case .bestSellers:
            return 1
        case .discover:
            return 1
        case .newArrivals:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .banner:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Banner", for: indexPath) as! BannerTableViewCell
            return cell
        case .discover:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Discover", for: indexPath) as! DiscoverTableViewCell
            cell.brands = brands
            cell.delegate = self 
            return cell
        case .newArrivals:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewArrivals", for: indexPath) as! NewArrivalsTableViewCell
            cell.makeupList = makeupList
            cell.delegate = self
            return cell
        case .bestSellers:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestSellers", for: indexPath) as! BestSellersTableViewCell
            cell.bestSellers = makeupList.filter { $0.brand == "maybelline"}
            cell.delegate = self
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        
        switch section {
        case .banner:
            return 300
        case .newArrivals:
            return 400
        case .bestSellers:
            return 220
        default:
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 16, y: 0, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        switch section {
        case .bestSellers:
            myLabel.text = "Best Sellers"
            return headerView
        case .discover:
            myLabel.text = "Discover"
            return headerView
        case .newArrivals:
            myLabel.text = "New Arrivals"
            return headerView
        default:
            return nil
        }
    }
    
}

extension ViewController: BestSellersTableViewCellDelegate {
    func bestSellersTableViewCell(_ cell: BestSellersTableViewCell, didSelect makeup: Makeup) {
        chosenMakeup = makeup
    }
    
}

extension ViewController: DiscoverTableViewCellDelegate {
    func discoverTableViewCell(_ cell: DiscoverTableViewCell, didTap brand: String) {
        let filteredMakeup = makeupList.filter { $0.brand == brand }
        filteredBrand = filteredMakeup
        
    }
}

extension ViewController: NewArrivalsTableViewCellDelegate {
    func newArrivalsTableViewCell(_ cell: NewArrivalsTableViewCell, didTap item: Makeup) {
        chosenMakeup = item
    }
    
    
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

