//
//  CustomChatCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/18.
//

import Foundation
import UIKit

class CustomChatCell: UITableViewCell {
    
    lazy var userImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "person")
    
        return image
    }()
    
    
    lazy var name: UILabel = {
        let name = UILabel()
    
        
        return name
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [userImage, name].forEach {
            contentView.addSubview($0)
        }
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(20)
        }
        userImage.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
//            $0.leading.equalToSuperview().offset(100)
            $0.width.height.equalTo(70)
        }
        name.snp.makeConstraints {
            $0.centerY.equalTo(userImage)
            $0.leading.equalTo(userImage.snp.trailing).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
