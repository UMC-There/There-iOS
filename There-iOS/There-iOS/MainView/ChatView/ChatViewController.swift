//
//  ChatViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import Then

class ChatViewController: UIViewController {

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        setup()
    
    }

    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "1"

        
        return cell
    }
}


extension ChatViewController {
    func setup() {
        let guide = view.safeAreaLayoutGuide
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: guide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
               ])
    }
}
