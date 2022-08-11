//
//  SignUpViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
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
    
    
    private let signUpBtn = CustomButton(text: "회원가입하기", bgColor: UIColor.black, titleColor: UIColor.white, imageName: "")

    



    // MARK: - Function

    @objc
    private func clickedSignUp() {
        let goLogin = LoginViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(goLogin, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        signUp()
        signUpBtn.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
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
        

    }
    
    
    // 서버 통신 코드를 실제로 뷰 컨트롤러에서 호출해서 사용하는 부분
    
    func signUp() {
        // 값 가져오기
        guard let name = nicknameField.text else {return}
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        guard let repassword = rePasswordField.text else {return}
        
        // 서버 통신 서비스 코드를 싱글톤 변수를 통해 접근
        // 호출 후에 받응 응답을 처리
        
        SignUpService.shared.signUp(name: name, email: email, password: password, checkpwd: repassword) {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else {return}
            
                self.alert(message: data.message)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }

}
