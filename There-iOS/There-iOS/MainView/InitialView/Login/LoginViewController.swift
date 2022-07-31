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
    }

    // MARK: - Property

    var stackView: UIStackView!
    var labelView: UIView!
    var textFieldView: UIStackView!
    var loginbtnView: UIStackView!
    var moreOprionView: UIStackView!
    

    private let label = UILabel().then {
        $0.text = "아이디와 비밀번호를 입력하세요"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 35.0)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 2
    }
        
    private let idField = CustomTextField(text: "아이디를 입력하세요")

    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0), titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    
//     MARK: - Function
    
    @objc
    private func clickedLogin() {
//        let home = HomeViewController(bgColor: UIColor.white)
//        home.modalPresentationStyle = .fullScreen
//        self.present(home, animated: false, completion: nil)
          let tab = MainTabBarController()
          tab.modalPresentationStyle = .fullScreen
          self.present(tab, animated: false, completion: nil)
        print("view convert")
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        loginBtn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
    }


}

extension LoginViewController {
    private func setUI() {
        safeView.addSubview(label)
        safeView.addSubview(idField)
        safeView.addSubview(loginBtn)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        
        idField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(350)
            $0.bottom.equalTo(loginBtn.snp.top)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true

    }
}
