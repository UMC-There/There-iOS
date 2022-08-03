//
//  LoginViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/25.
//

import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController {
    
    // 공통 인스턴스에 있는 통신하는 메서드를 호출해서 받은 데이터를 실질적으로 가공함
    
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
        label.text = "아이디와 비밀번호를 입력하세요"
        
        return label

    }()

    private lazy var idField: UITextField = {
        let id = CustomTextField(text: "아이디를 입력하세요")

        return id
    }()
    
    private lazy var passwordField: UITextField = {
        let password = CustomTextField(text: "비밀번호를 입력하세요")
        password.isSecureTextEntry = true

        return password
    }()
    
    private lazy var findMyProfile: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.text = "아이디/비밀번호 찾기"
        label.textColor = UIColor.rgb(red: 100, green: 116, blue: 139)
        
        return label
    }()
        

    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.black, titleColor: UIColor.white)
    
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
    
    private lazy var checkMember: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = UIColor.rgb(red: 100, green: 116, blue: 139)
        label.text = "아직 회원이 아니신가요?"
        
        return label
    }()

    private lazy var goSignUp: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.label, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        return btn
    }()
    
    private lazy var chevronBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.right")
        
        return btn
    }()
    
    // MARK: - Function
    
    @objc
    private func clickedLogin() {
          let tab = MainTabBarController()
          tab.modalPresentationStyle = .fullScreen
          self.present(tab, animated: false, completion: nil)
    }
    
    @objc
    private func clickedSignUp() {
        let signUp = SignUpViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(signUp, animated: false)
    }
    
    func loginAction() {
        LoginService.shared.login(completion: result in
                                  switch result {
        case .success(let message):
            print("success-", message)
        case .requestErr(let message):
            print("requestErr")
        case .pathErr:
            print("pathErr")
        case .serverErr:
            print("serverErr")
        case .networkFail:
            print("networkFail")
                                    
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        loginBtn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        goSignUp.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
    }
}

    
    // MARK: - Extension


extension LoginViewController {
    func setup() {
        [
            label,
            idField,
            passwordField,
            findMyProfile,
            loginBtn,
            insta,
            google,
            checkMember,
            goSignUp,
            chevronBtn,
            
        ].forEach { view.addSubview($0) }
        
        let basicOffset = 20
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalToSuperview().inset(150)
        }
        
        idField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(label.snp.bottom).offset(80)
        }
               
        passwordField.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.trailing.equalTo(label)
            $0.top.equalTo(idField.snp.bottom).offset(35)
        }
        
        findMyProfile.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(passwordField.snp.bottom).offset(10)
        }

        loginBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(label)
            $0.top.equalTo(findMyProfile.snp.bottom).offset(60)
        }
        
        insta.snp.makeConstraints {
            $0.leading.equalTo(label)
            $0.top.equalTo(loginBtn.snp.bottom).offset(15)
        }
        google.snp.makeConstraints {
            $0.leading.equalTo(insta.snp.trailing).offset(10)
            $0.top.equalTo(insta)
        }
        checkMember.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(90)
            $0.top.equalTo(google.snp.bottom).offset(110)
        }
        
        goSignUp.snp.makeConstraints {
            $0.leading.equalTo(checkMember.snp.trailing).offset(10)
            $0.top.equalTo(google.snp.bottom).offset(103)
        }
        
        chevronBtn.snp.makeConstraints {
            $0.leading.equalTo(goSignUp.snp.trailing).offset(10)
            $0.top.equalTo(google.snp.bottom).offset(107)
        }
    }
}

