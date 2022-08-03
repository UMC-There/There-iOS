//
//  TileCollectionViewCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/25.
//

import UIKit

// MARK: - Struct
struct TileCollectionViewCellViewModel {
    let name: String
    let backgroundColor: UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
//        contentView.layer.cornerRadius = 20
//        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Property
    
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    // MARK: - Function
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
