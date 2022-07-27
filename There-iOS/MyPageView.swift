//
//  MyPageView.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/20.
//

import UIKit

class MyPageView: UIView {

    //상단바
    lazy var userName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "계정명" //서버연동
        name.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
        name.snp.makeConstraints {
            $0.width.equalTo(100).priority(999)
            
        }
        return name
    }()
    
    lazy var addBtn: UIImageView = {
        let add = UIImageView(image: UIImage(systemName: "plus"))
        add.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
//                $0.height.equalTo(60.0)
            $0.width.equalTo(30.0)
        }
        return add
    }()
    
    
    lazy var TopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userName, addBtn])
        stackView.axis = .horizontal // default
        stackView.distribution = .fill // default
        stackView.alignment = .fill // default
        view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25.0)
            $0.right.equalToSuperview().offset(-25.0)
            $0.height.equalTo(80)
        }

        return stackView
    }()
    
    
    //profile cell 등록
    MypageView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    

}
