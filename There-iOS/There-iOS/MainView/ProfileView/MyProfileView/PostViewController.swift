//
//  PostViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import SnapKit
import Then


class PostViewController: UIViewController {

    // MARK: - Init
    convenience init() {
        self.init()
        self.view.backgroundColor = UIColor.white
//        self.navigationItem.title = "그곳"
    }
  
//    init(post: Post) {
//        super.init(nibName: nil, bundle: nil)
//
//        presenter = PostPresenter(viewController: self, post: post)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
//    private var presenter: PostPresenter!
    
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

//extension PostViewController: PostPresenter {
//    init(post: Post) {
//    
//    }
//}
