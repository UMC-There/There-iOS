//
//  CustomButton.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/26.
//

import Foundation
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 275).isActive = true
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true

  
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 0)
        self.tintColor = UIColor.rgb(red: 65, green: 65, blue: 65)
        
        
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

