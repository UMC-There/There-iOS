//
//  PostViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import Foundation
import SnapKit
import Then


class PostViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }

    
    // MARK: - Property
    
    let uploadViewController = UINavigationController(rootViewController: UploadViewController(uploadImage: UIImage()))

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self

        tableView.register(CustomPostCell.self, forCellReuseIdentifier: "CustomPostCell")

        return tableView
    }()

    
    private lazy var test: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.numberOfLines = 5
        title.font = .systemFont(ofSize: 15.0, weight: .light)
        title.text = "테스트"
        
        return title
    }()
    
    @objc func didTapUploadButton(){
       present(uploadViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}


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

