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
    
    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        title = "ppppppp"
    }

    
    // MARK: - Property

    var stackView: UIStackView!
    var labelView: UIView!
    var textFieldView: UIStackView!
    var loginbtnView: UIStackView!
    var moreOprionView: UIStackView!
    
//    private let label = UILabel().then {
//        $0.text = "아이디와 비밀번호를 입력하세요"
//        $0.font = UIFont.boldSystemFont(ofSize: 40.0)
//    }

    private let loginBtn = CustomButton(text: "로그인 해버리기", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0),
                                        titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    
    
    @objc
    func buttonClicked(_ sender: CustomButton?) {
        if sender == loginBtn {
            let loginView = LoginViewController(bgColor: UIColor.yellow)
//            loginView.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(loginView, animated: true)
        }else {
            let signUpView = SignUpViewController(bgColor: UIColor.white)
            signUpView.modalPresentationStyle = .fullScreen
            self.present(signUpView, animated: false, completion: nil)
        }
    }
    
    
//     MARK: - Function

    func setLayout() {
//        loginBtn.then {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true

    }

    @objc func popVC() {
        print("pop")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginBtn)
        setLayout()
        
        
        loginBtn.addTarget(self, action: #selector(popVC), for: .touchUpInside)
    }


}
