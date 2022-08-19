//
//  CustomChatCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/18.
//

import Foundation
import UIKit

class CustomChatCell: UITableViewCell {
    
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var userImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "person")
    
        return image
    }()
    
    
    lazy var nickName: UILabel = {
        let name = UILabel()
        
        name.textColor = .label
        name.font = .systemFont(ofSize: 17.0, weight: .light)
        name.text = "닉네임"
        
        return name
    }()
    
    lazy var time: UILabel = {
        let time = UILabel()
        
        time.textColor = .darkGray
        time.font = .systemFont(ofSize: 14.0, weight: .light)
        time.text = "오후 12:00"
        
        return time
    }()

    lazy var chatContents: UILabel = {
        let contents = UILabel()
        
        contents.textColor = .label
        contents.font = .systemFont(ofSize: 17.0, weight: .light)
        contents.text = "이곳에 마지막 채팅내용을 입력하세요."
        
        return contents
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [userImage, nickName, time, chatContents].forEach {
            contentView.addSubview($0)
        }
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(10)
        }
        userImage.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
//            $0.leading.equalToSuperview().offset(100)
            $0.width.height.equalTo(70)
        }
        nickName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        chatContents.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        time.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.trailing).inset(100)
            $0.top.equalToSuperview().offset(20)
            
        }
    }
    

}
