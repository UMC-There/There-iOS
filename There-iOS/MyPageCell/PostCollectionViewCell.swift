//
//  PostCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/20.
//

import UIKit
import Kingfisher //설치해야함

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupData()
    }
    
    public func setupData(_ imageURLStr: String?){
            //imageView의 이미지를 업로드한다.
            guard let imageURLStr = imageURLStr else {return }
            
            if let url = URL(string: imageURLStr){
                postImageView.kf.setImage(with: url,
                                          placeholder: UIImage(systemName:  "photo"))
            }
        }
        //이미지뷰의 이미지 업로드 [서버연결]
}
