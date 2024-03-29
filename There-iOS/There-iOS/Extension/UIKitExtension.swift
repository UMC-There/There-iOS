//
//  UIKitExtension.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation
import UIKit


extension UIColor {
    //rgb 컬러 정수로 계산하는 UIColor Extension
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    //Signiture Color
    static var mainColor = UIColor.rgb(red: 255, green: 85, blue: 54)
    
    static var enableMainColor = UIColor.rgb(red: 250, green: 224, blue: 212)
}

extension UIViewController {
    var safeView:UIView {
        //get 방식을 통해 읽기전용으로 sageView 구현
        get{
            guard let safeView = self.view.viewWithTag(Int(INT_MAX)) else {
                let guide = self.view.safeAreaLayoutGuide
                let view = UIView()
                view.tag = Int(INT_MAX)
                //view.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
                self.view.addSubview(view)
                view.snp.makeConstraints {
                    $0.edges.equalTo(guide)
                }
                return view
            }
            return safeView
        }
    }
}

extension UITextField {
    
    func setLeft(image: UIImage, withPadding padding: CGFloat = 0) {
        let wrapperView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 31, height: 21))
        let imageView = UIImageView(frame: CGRect.init(x: 10, y: 0, width: 21, height: 21))
        
        imageView.image = image
        imageView.tintColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        imageView.contentMode = .scaleAspectFit
        wrapperView.addSubview(imageView)
        
        leftView = wrapperView
        leftViewMode = .always
        
    }
    
    func setErrorRight() {
        let wrapperView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: bounds.height, height: bounds.height))
        let imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 21, height: 20))
        
        imageView.image = UIImage(named: "tfAlert")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        wrapperView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        rightView = wrapperView
        rightViewMode = .always
        
    }
    
    func setRight() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(named: "tfCancel")!, for: .normal)
        clearButton.tintColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        clearButton.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        clearButton.addTarget(self, action: #selector(UITextField.clear), for: .touchUpInside)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingDidBegin)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingChanged)
        self.rightView = clearButton
        
        self.rightViewMode = .whileEditing
    }
    
    @objc private func displayClearButtonIfNeeded() {
        self.rightView?.isHidden = (self.text?.isEmpty) ?? true
    }
    
    @objc private func clear(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
    
    var datePicker: UIDatePicker {
        get {
            let SCwidth = self.bounds.width
            let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 216))
            datePicker.datePickerMode = .date
            datePicker.isSelected = true
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
                datePicker.setValue(UIColor.black, forKey: "textColor")
            }
            return datePicker
        }
    }
    
    func setDatePicker(target: Any) {
        
        self.inputView = datePicker
        let SCwidth = self.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(donePressed))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
        
    }
    
    @objc func donePressed(_ sender: UIDatePicker) {
        if let datePicker = self.inputView as? UIDatePicker {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy / MM / dd"
            let strDate = dateFormater.string(from: datePicker.date)
            self.text = strDate
        }
        
        self.resignFirstResponder()
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
