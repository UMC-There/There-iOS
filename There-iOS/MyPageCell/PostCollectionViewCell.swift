//
//  PostCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/20.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupData()
    }
    public func setupData(){
        //이미지뷰의 이미지 업로드 [서버연결]
    }
}
