//
//  CustomButton.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/26.
//


import Foundation
import UIKit

class CustomButton: UIButton {


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, bgColor: UIColor, titleColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true

  
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.setTitle(text, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = bgColor
     
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true

    }
//
//    override func buttonRect(forBounds bounds: CGRect) -> CGRect {
//        let rect = super.editingRect(forBounds: bounds)
//        return rect.inset(by: UIEdgeInsets.init(top: 12, left: 40, bottom: 13, right: 40))
//    }
  
}

