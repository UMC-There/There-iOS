//
//  SettingTableViewCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/09/28.
//

import UIKit


final class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Property


    private lazy var chargingAmountView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 255, green: 222, blue: 1)
        
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
        title.text = "100,000원"
        title.textColor = .black
        
        return title
    }()
    

    private lazy var chargingBtn: UIButton = {
        let btn = CustomButton(text: "충전하기", bgColor: .white, titleColor: .darkGray, imageName: "")
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0

        
        return btn
    }()
    
    private lazy var purchaseHistoryBtn: UIButton = {
        let btn = CustomButton(text: "구매내역", bgColor: .white, titleColor: .darkGray, imageName: "")
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0
        
        return btn
    }()
    
}
