//
//  PostCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/28.
//

import UIKit
import SnapKit
import Kingfisher

final class PostCollectionViewCell: UICollectionViewCell {
    let postImageView = UIImageView()
    func setup(with image: UIImage){
        addSubview(postImageView)
        postImageView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        postImageView.image = image
        //imageView.backgroundColor = .tertiaryLabel
    }
    public func uploadData(_ imageURLStr: String?){
        //imageView의 이미지를 업로드한다.
        guard let imageURLStr = imageURLStr else {return }
        
        if let url = URL(string: imageURLStr){
            postImageView.kf.setImage(with: url,
                                      placeholder: UIImage(systemName:  "photo"))
        }
    }


    
}

