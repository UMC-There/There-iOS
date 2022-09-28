//
//  ChargingListViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/19.
//

import UIKit

class ChargingListViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        self.navigationItem.title = "충전내역"
    }
    
    // MARK: - Property
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Function
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.register(CustomChargeCell.self, forCellReuseIdentifier: "cell")
        configure()
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
    }
}

// MARK: - Extension

extension ChargingListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomChargeCell else {return .init()}

        
        return cell
    }
}
