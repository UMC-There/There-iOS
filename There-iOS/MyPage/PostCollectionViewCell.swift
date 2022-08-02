//
//  PostCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/28.
//

import UIKit
import SnapKit

final class PostCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    func setup(with image: UIImage){
        addSubview(imageView)
        imageView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        imageView.backgroundColor = .tertiaryLabel
    }
}
