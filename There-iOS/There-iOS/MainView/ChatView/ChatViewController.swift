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
        self.navigationItem.title = "채팅"
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
        self.tableView.register(CustomChatCell.self, forCellReuseIdentifier: "cell")
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomChatCell else {return .init()}

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chattingRoom = ChattingRoomViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(chattingRoom, animated: false)
    }
}
