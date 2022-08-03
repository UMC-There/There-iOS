//
//  SearchViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        navigationItem.title = "Instagram"
    }
    
    // MARK: Property
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var data = ["chaeyeon", "day6", "wonpil", "dowoon", "youngk", "sungjin", "saranghae"]
    var sub = ["hamburger", "hungry", "myday", "super", "dupa", "hi" ,"hello"]
    var filteredData: [String] = []
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive&&isSearchBarHasText
    }
    
    // MARK: Function
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색어를 입력하세요"
        
        searchController.searchBar.scopeButtonTitles = ["인기", "계정", "태그"]
        searchController.searchBar.showsScopeBar = true // search bar 비활성화 상태에도 scope bar 나타나게 하기
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때 추가

    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeView.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.setupSearchController()
        self.setupTableView()
        
    }


}

// MARK: Extension

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredData.count : self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        cell.imageView!.image = UIImage(named: "1")
        cell.imageView!.layer.cornerRadius = CGFloat(22)
        cell.imageView!.clipsToBounds = true
        if isFiltering {
            cell.textLabel?.text = self.filteredData[indexPath.row]
            cell.detailTextLabel?.text = self.sub[indexPath.row]
        } else {
            cell.textLabel?.text = self.data[indexPath.row]
            cell.detailTextLabel?.text = self.sub[indexPath.row]
        }
        return cell
    }
        
}
        

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else {return}
        self.filteredData = self.data.filter { $0.lowercased().hasPrefix(text)}
        
        dump(filteredData)
        self.tableView.reloadData()
    }
}
