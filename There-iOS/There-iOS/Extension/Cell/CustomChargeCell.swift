//
//  CustomChargeCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/19.
//

import Foundation
import UIKit

class CustomChargeCell: UITableViewCell {
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [chargeTime, chargeTitle, chargeMoney].forEach {
            contentView.addSubview($0)
        }
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(10)
        }

        chargeTime.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().offset(30)
        }
        
        chargeTitle.snp.makeConstraints {
            $0.top.equalTo(chargeTime.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(chargeTime)
        }
        
        chargeMoney.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(chargeTime.snp.trailing).inset(130)
        }
        
    }
    
    // MARK: - Property
    
    private lazy var chargeTime: UILabel = {
       let time = UILabel()
        time.text = "2022.00.00 00:00"
        time.font = .systemFont(ofSize: 13, weight: .light)
        time.textColor = UIColor.systemGray
        
        return time
    }()
    
    private lazy var chargeTitle: UILabel = {
        let label = UILabel()
        label.text = "내 금액 충전"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var chargeMoney: UILabel = {
        let label = UILabel()
        label.text = "w20,000"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .label
        
        return label
    }()

    
}

