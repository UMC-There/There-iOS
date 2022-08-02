//
//  PostViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/29.
//

import UIKit
import SnapKit
import Then


class PostViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        view.backgroundColor = bgColor
        navigationItem.title = "Instagram"
    }

    // MARK: - Property
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(CustomPostCell.self, forCellReuseIdentifier: "CustomPostCell")
        
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
}

// MARK: - Extension

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomPostCell", for: indexPath) as? CustomPostCell
        cell?.selectionStyle = .none
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
}

private extension PostViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()}
    }
}
