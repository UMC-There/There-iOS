//
//  PortfolioTableViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/28.
//

import UIKit
import SnapKit

final class PortfolioTableViewCell: UITableViewCell {
    override var frame: CGRect{
        get {
                return super.frame
            }
            set {
                var frame = newValue
                //frame.origin.x += 25
                frame.size.height = 70

                super.frame = frame
            }
    }
    
    private lazy var folderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        label.text = "포트폴리오 제목"
        return label
    }()
    
    private lazy var postCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.text = "123"
        return label
    }()
    
    private lazy var postLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.text = "개"
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
   
   
    private lazy var likeCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.text = "123"
        return label
    }()
    
    func setUp(){
        let portDataStackView = UIStackView(arrangedSubviews: [postCountLabel,postLabel,likeButton,likeCountLabel])
        portDataStackView.spacing = 12.0
        
        [folderImageView,titleLabel, portDataStackView] .forEach {addSubview($0)}
        
        let inset: CGFloat = 16.0
       
        folderImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(folderImageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(folderImageView.snp.trailing).offset(inset)
            
        }
        
        portDataStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(folderImageView.snp.trailing).offset(inset)
            $0.centerY.equalTo(folderImageView.snp.centerY) //중앙정렬
        }
        
        //왜 겹치게 나오지........
    }
 
}

