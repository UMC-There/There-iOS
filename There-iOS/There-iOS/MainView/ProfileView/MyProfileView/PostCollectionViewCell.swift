//
//  PostCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/20.
//

import UIKit
import SnapKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
   let postImageView = UIImageView()
   func setupImage(with image: UIImage){
        addSubview(postImageView)
        postImageView.snp.makeConstraints{ $0.edges.equalToSuperview() }
       /*
        postImageView.image = UIImage() //
        postImageView.backgroundColor = .tertiaryLabel //서버연동해서 이미지데이터받아오기
        */
    }
    
}

