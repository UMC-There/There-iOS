//
//  ChatViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit
import Then

class ChatViewController: UIViewController {

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }
    
    var loginBtn = CustomButton(text: "로그인")
    
    
    func setLayout() {
        loginBtn.then {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginBtn)
        setLayout()
    
    }


}
