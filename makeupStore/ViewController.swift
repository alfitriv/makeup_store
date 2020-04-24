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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
        networkLayer.fetchMakeupListJSON(successHandler: { [weak self] (makeup) in
            self?.makeupList = makeup
            let filteredBrands = self?.makeupList.compactMap { $0.brand }
            self?.brands = filteredBrands?.removingDuplicates()
            self?.progressIndicator.isHidden = true
            self?.progressIndicator.stopAnimating()
            self?.tableView.reloadData()
        }) { (error) in
            print(error)
        }
        
        sections = [
            HomeSections.banner,
            HomeSections.discover,
            HomeSections.newArrivals,
            HomeSections.bestSellers
        ]
        
        //brands = makeupList.compactMap { $0.brand }
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "Banner")
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "Discover")
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
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
            return cell
        case .newArrivals:
            let cell = UITableViewCell()
            return cell
        case .bestSellers:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        
        switch section {
        case .banner:
            return 300
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 16, y: -8, width: 320, height: 20)
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
