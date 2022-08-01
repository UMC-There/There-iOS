//
//  CustomPostCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/01.
//

import SnapKit
import UIKit



final class CustomPostCell: UITableViewCell {
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
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "양채연님 외 32명이 좋아합니다."
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "나는 지금 마라탕, 마라샹궈, 곱창, 치킨, 떡볶이, 케이크, 순두부찌게, 아이스크림, 초콜릿, 김치나베를 먹고싶다"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        // 추후 코드 유지보수를 고려
        [
            postImageView,
            likeBtn,
            commentBtn,
            directBtn,
            likedCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
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
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.leading)
            $0.trailing.equalToSuperview().inset(btnInset)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
    }

}
