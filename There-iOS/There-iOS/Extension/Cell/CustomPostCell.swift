//
//  CustomPostCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation
import SnapKit
import UIKit

final class CustomPostCell: UITableViewCell {
    
    
    // MARK: - Property

    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "person")
        imageView.layer.cornerRadius = CGFloat(25)
        imageView.clipsToBounds = true

        
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let name = UILabel()
        
        name.textColor = .label
        name.font = .systemFont(ofSize: 20.0, weight: .light)
        name.text = "사용자명"
        
        return name
    }()
    
    private lazy var optionBtn: UIButton = {
        let option = UIButton()
        option.setImage(systemName: "ellipsis")
        
        return option
    }()
    
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "heart")
        
        return btn
    }()
    
    private lazy var commentBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "message")
        
        return btn
    }()
    
    private lazy var directBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "paperplane")
        
        return btn
    }()
    
    
    private lazy var likedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15.0, weight: .light)
        label.text = "양채연님 외 32명이 좋아합니다."
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 15.0, weight: .light)
        label.text = "나는 지금 마라탕, 마라샹궈, 곱창, 치킨, 떡볶이, 케이크, 순두부찌게, 아이스크림, 초콜릿, 김치나베를 먹고싶다"
        
        return label
    }()
    
    private lazy var hashtagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 15.0, weight: .light)
        label.text = "#음식 #먹스타그램"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
    private lazy var hisyotyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18.0, weight: .light)
        label.text = "히스토리"
    
        return label
    }()
    
    private lazy var historyUpload: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "plus")
        
        return btn
    }()
    

    
    private lazy var historyView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.addSubview(hisyotyLabel)
        view.addSubview(historyUpload)
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.green.cgColor
        
        return view
    }()
    
    // MARK: - Function
    
    func setup() {
        // 추후 코드 유지보수를 고려
        [
            userImageView,
            userName,
            optionBtn,
            postImageView,
            likeBtn,
            commentBtn,
            directBtn,
            likedCountLabel,
            contentsLabel,
            hashtagLabel,
            dateLabel,
            hisyotyLabel,
            historyUpload,
            historyView
        ].forEach { addSubview($0) }
        
        userImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        userName.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing).offset(15)
            $0.top.equalTo(userImageView).offset(13)
        }
        
        optionBtn.snp.makeConstraints {
            $0.leading.equalTo(userName.snp.trailing).offset(50)
            $0.top.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().inset(20)
        }
        

        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(userImageView.snp.bottom).offset(20)
            $0.height.equalTo(postImageView.snp.width) // 1:1 비율의 이미지 뷰
        }
        
        let btnWidth: CGFloat = 24.0
        let btnInset: CGFloat = 16.0
        
        likeBtn.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(btnInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(btnInset)
            $0.width.equalTo(btnWidth)
            $0.height.equalTo(btnWidth)
        }
        
        commentBtn.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.trailing).offset(12.0)
            $0.top.equalTo(likeBtn.snp.top)
            $0.width.equalTo(btnWidth)
            $0.height.equalTo(btnWidth)
        }
        
        directBtn.snp.makeConstraints {
            $0.leading.equalTo(commentBtn.snp.trailing).offset(12.0)
            $0.top.equalTo(likeBtn.snp.top)
            $0.width.equalTo(btnWidth)
            $0.height.equalTo(btnWidth)
        }
        
        likedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.trailing.equalToSuperview().inset(btnInset)
            $0.top.equalTo(likeBtn.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.trailing.equalToSuperview().inset(btnInset)
            $0.top.equalTo(likedCountLabel.snp.bottom).offset(8.0)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.trailing.equalToSuperview().inset(btnInset)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.trailing.equalToSuperview().inset(btnInset)
            $0.top.equalTo(hashtagLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        hisyotyLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.top.equalTo(dateLabel.snp.bottom).offset(15)
        }
        
        historyUpload.snp.makeConstraints {
            $0.leading.equalTo(hisyotyLabel.snp.trailing).offset(300)
            $0.top.equalTo(hisyotyLabel)
        }
        
        historyView.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)

        }

//        historyUpload.addTarget(self, action: #selector(didTapUploadButton()), for: .touchUpInside)
    }

}
