//
//  MoreViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import SnapKit
import Then


//enum ChargingSection {
//    case
//}

class MoreViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }

    
    // MARK: - Property
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self

        tableView.register(CustomPaymentCell.self, forCellReuseIdentifier: "CustomPaymentCell")
        tableView.register(CustomOptionCell.self, forCellReuseIdentifier: "CustomOptionCell")
        
        return tableView
    }()
    
    private let settingTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.register(CustomPaymentCell.self, forCellReuseIdentifier: "CustomPaymentCell")
        $0.register(CustomOptionCell.self, forCellReuseIdentifier: "CustomOptionCell")
        $0.separatorStyle = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

    }
}


extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.tableView
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomPaymentCell", for: indexPath) as? CustomPaymentCell
                
        cell?.selectionStyle = .none
        cell?.chargingSetup()
            cell?.setup()


        return cell ?? UITableViewCell()
    }
    
}

private extension MoreViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()}
    }
}

