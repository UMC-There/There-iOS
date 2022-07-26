//
//  LoginViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/25.
//

import UIKit
import Then

class LoginViewController: UIViewController {

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }

    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0),
                                        titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    private let registerBtn = CustomButton(text: "로그인뷰이다", bgColor: UIColor.rgb(red: 255, green: 255, blue: 255),
                                           titleColor: UIColor.rgb(red: 0, green: 0, blue: 0))
    
//    loginBtn.addTarget(self, action: #selector(self.btnClicked(<#T##CustomButton?#>)), for: .touchUpInside)
    
//    func btnClicked(_ sender: CustomButton?) {
//        if sender == loginBtn {
//            let loginView = LoginViewController()
//            loginView.modalPresentationStyle = .fullScreen
//            self.present(loginView, animated: true, completion: nil)
//        }else {
//
//        }
//
//    }
    
    func setLayout() {
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        
        
        registerBtn.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginBtn)
        self.view.addSubview(registerBtn)
        setLayout()
    
    }


}
