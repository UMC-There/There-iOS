//
//  SignUpViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/25.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Init

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }
    
    // MARK: - Property
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35.0, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .label
        label.text = "회원가입을 하세요"
        
        return label

    }()
    
    private lazy var nicknameField: UITextField = {
        let nickname = CustomTextField(text: "닉네임을 입력하세요")

        return nickname
    }()
    
    private lazy var emailField: UITextField = {
        let email = CustomTextField(text: "이메일을 입력하세요")

        return email
    }()
    
    private lazy var passwordField: UITextField = {
        let password = CustomTextField(text: "비밀번호를 입력하세요")
        password.isSecureTextEntry = true

        return password
    }()
    
    private lazy var rePasswordField: UITextField = {
        let rePassword = CustomTextField(text: "비밀번호를 다시 입력하세요")
        rePassword.isSecureTextEntry = true

        return rePassword
    }()
    
    
    private let signUpBtn = CustomButton(text: "회원가입하기", bgColor: UIColor.black, titleColor: UIColor.white)

    
    private lazy var insta: UIButton = {
        let btn = CustomSnsButton(text: "인스타그램", bgColor: UIColor.white, titleColor: UIColor.black, imageName: "Instagram")
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 12)

        return btn
    }()
    
    private lazy var google: UIButton = {
        let btn = CustomSnsButton(text: "구글", bgColor: UIColor.white, titleColor: UIColor.black, imageName: "Google")
        btn.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 12)
        
        return btn
    }()


    // MARK: - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }


}

// MARK: - Extension

extension SignUpViewController {
    func setup() {
        [
            label,
            nicknameField,
            emailField,
            passwordField,
            rePasswordField,
            signUpBtn,
            insta,
            google,

            
        ].forEach { view.addSubview($0) }
        
        let basicOffset = 20
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalToSuperview().inset(150)
        }
        
        nicknameField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(label.snp.bottom).offset(80)
        }
        
        emailField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(nicknameField.snp.bottom).offset(35)
        }
        
        passwordField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(emailField.snp.bottom).offset(35)
        }
        
        
        rePasswordField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(passwordField.snp.bottom).offset(35)
        }
        
        signUpBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(label)
            $0.top.equalTo(rePasswordField.snp.bottom).offset(60)
        }
        
        insta.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.top.equalTo(signUpBtn.snp.bottom).offset(15)
        }
        google.snp.makeConstraints {
            $0.leading.equalTo(insta.snp.trailing).offset(10)
            $0.top.equalTo(insta)
        }
    }
    

}
