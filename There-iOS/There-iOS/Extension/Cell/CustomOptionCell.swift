//
//  CustomOptionCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/10.
//

import UIKit

final class CustomOptionCell: UITableViewCell {
    
    // MARK: - Property

    private lazy var option: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .light)
        label.text = "설정"
        label.textColor = .black
        
        return label
    }()
    

    private lazy var rightBtn: UIButton = {
        let btn = UIButton()
        
        
        return btn
    }()



    // MARK: - Function

    func setup() {
        // 추후 코드 유지보수를 고려
        [
            option,
            rightBtn
        ].forEach { addSubview($0)}
        
        option.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        

    }

    }



