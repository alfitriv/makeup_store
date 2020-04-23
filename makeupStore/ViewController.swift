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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkLayer.fetchMakeUpList(successHandler: { [weak self] (makeup) in
            self?.makeupList = makeup
        }) { (error) in
            print(error)
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
    
    
}
