//
//  FundTableViewCell.swift
//  There-iOS
//
//  Created by 양채연 on 2022/09/28.
//

import Foundation
import UIKit

class FundTableViewCell: UITableViewCell {
    
    private lazy var setting: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .light)
        label.text = "알림 및 소리"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var settingBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.forward")
        
        return btn
    }()
    
}
