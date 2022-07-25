//
//  MoreViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    convenience init(bgColor: UIColor) {
            self.init()
            self.view.backgroundColor = bgColor
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Microsoft", backgroundColor: .systemRed),
            TileCollectionViewCellViewModel(name: "Kakao", backgroundColor: .systemYellow),
            TileCollectionViewCellViewModel(name: "Naver", backgroundColor: .systemGreen),
            TileCollectionViewCellViewModel(name: "Facebook", backgroundColor: .systemGray),
            TileCollectionViewCellViewModel(name: "Intel", backgroundColor: .systemPink),
            TileCollectionViewCellViewModel(name: "Naver", backgroundColor: .systemGreen),
            TileCollectionViewCellViewModel(name: "Facebook", backgroundColor: .systemGray),
            TileCollectionViewCellViewModel(name: "Intel", backgroundColor: .systemPink),
        ])
    ]
    
    
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

extension MoreViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "You successfully get the selected item!", preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
