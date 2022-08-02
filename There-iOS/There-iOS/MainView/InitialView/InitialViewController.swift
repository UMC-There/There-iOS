//
//  LoginViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/26.
//


import UIKit
import Then
import SnapKit

class InitialViewController: UIViewController {

    // MARK: - Init
    
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    title = "로그인"
    }
    
    // MARK: - Property
    
    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0), titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    private let signUpBtn = CustomButton(text: "회원가입", bgColor: UIColor.rgb(red: 255, green: 255, blue: 255), titleColor: UIColor.black)
    
    
    // MARK: - Function
    
    @objc
    private func clickedLogin() {
        let login = LoginViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(login, animated: false)
    }
    @objc
    private func clickedSignUp() {
        let signUp = SignUpViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(signUp, animated: false)
    }
            
    func setLayout() {
        let basicOffset = 20
        
        loginBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(540)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(basicOffset)
        }
        
        signUpBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.top.equalTo(loginBtn.snp.bottom).offset(20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
        setLayout()
        
        loginBtn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
        
    }

}

