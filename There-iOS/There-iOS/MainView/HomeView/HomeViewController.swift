//
//  HomeViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        navigationItem.title = "그곳"
    }
    
    static var istapped = false
    
    
    // MARK: - Property
    

    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemRed),
            TileCollectionViewCellViewModel(name: "Microsoft", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Kakao", backgroundColor: .systemYellow),
            TileCollectionViewCellViewModel(name: "Naver", backgroundColor: .systemGreen),
            TileCollectionViewCellViewModel(name: "Facebook", backgroundColor: .systemGray),
        ])
    ]
    
    // MARK: - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds

    }
    
//    override func viewWillLayoutSubviews() {
//        if HomeViewController.istapped == true {
//            let post = PostViewController(bgColor: UIColor.white)
//            self.navigationController?.pushViewController(post, animated: false)
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath
        ) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
    


}

// MARK: - Extension
extension HomeViewController: CollectionTableViewCellDelegate {

    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
//        let alert = UIAlertController(title: viewModel.name, message: "You successfully get the selected item!", preferredStyle: .alert
//        )
//
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
////        present(alert, animated: true)
//
//        let post = PostViewController()
//        self.present(post, animated: true)

    }
}
