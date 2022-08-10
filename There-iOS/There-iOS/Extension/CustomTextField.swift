//
//  CustomTextField.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation
import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init()
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 100, green: 116, blue: 139)])
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true
        self.delegate = self
        self.textColor = UIColor.rgb(red: 13, green: 15, blue: 17)

    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 12, left: 40, bottom: 13, right: 40))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets.init(top: 12, left: 9, bottom: 13, right: 9))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        let border = CALayer()
        border.frame = CGRect(x: 0,  y: self.frame.size.height-1, width: self.frame.width/1.1, height: 1)
        border.borderWidth = 1
        border.backgroundColor = UIColor.systemGray2.cgColor
        self.layer.addSublayer(border)
        return rect.inset(by: UIEdgeInsets.init(top: 12, left: 9, bottom: 13, right: 9))
    }
    
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.backgroundColor = UIColor.rgb(red: 247, green: 248, blue: 249)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.backgroundColor = UIColor.rgb(red: 247, green: 248, blue: 249)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}
