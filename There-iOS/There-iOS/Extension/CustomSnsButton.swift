//
//  CustomSnsButton.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/02.
//

import Foundation
import UIKit

class CustomSnsButton: UIButton {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, bgColor: UIColor, titleColor: UIColor, imageName: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 180).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
  
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.setTitle(text, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = bgColor
        
        self.setImage(UIImage(named: imageName), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
     
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray2.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true

    }
  
}

