//
//  CustomPaymentCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/10.
//


import Foundation
import SnapKit
import UIKit

final class CustomPaymentCell: UITableViewCell {
    
    // MARK: - Property
    
    private lazy var chargingAmountView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    
    private lazy var chargingTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20.0, weight: .light)
        title.text = "충전금액"
        title.textColor = .black
        
        
        return title
    }()
    
    private lazy var chargingMoney: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 40.0, weight: .medium)
        title.text = "10000원"
        title.textColor = .black
        
        return title
    }()
    

    private lazy var chargingBtn: UIButton = {
        let btn = CustomButton(text: "충전하기", bgColor: .white, titleColor: .darkGray)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0

        
        return btn
    }()
    
    private lazy var purchaseHistoryBtn: UIButton = {
        let btn = CustomButton(text: "구매내역", bgColor: .white, titleColor: .darkGray)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0
        
        return btn
    }()
    
    
    
    // MARK: - Function
    
    func chargingSetup() {
        [
            chargingTitle,
            chargingMoney,
            chargingBtn,
            purchaseHistoryBtn
            
        ].forEach { chargingAmountView.addSubview($0) }
        
        chargingTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(47)
        }
        
        chargingMoney.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(chargingTitle).offset(28)
        }
        
        chargingBtn.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(chargingMoney).offset(80)
        }
        
        purchaseHistoryBtn.snp.makeConstraints {
            $0.leading.equalTo(chargingBtn.snp.trailing).offset(20)
            $0.top.equalTo(chargingBtn)
        }
    }
    
    func setup() {
        // 추후 코드 유지보수를 고려
        [
            chargingAmountView,
            
        ].forEach { addSubview($0) }
    
        
        chargingAmountView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(220)
        }
        
        
        
    }

}
