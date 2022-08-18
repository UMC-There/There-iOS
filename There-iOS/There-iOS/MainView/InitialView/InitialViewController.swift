//
//  InitialViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import Then
import SnapKit

class InitialViewController: UIViewController {

    // MARK: - Init
    
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }
    
    // MARK: - Property
    
    private lazy var appTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35.0, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .label
        label.text = "세상 어디에도 없는 곳,"
        
        return label

    }()
    
    private lazy var appTitle2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35.0, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .label
        label.text = "그곳"
        
        return label

    }()


    private lazy var appLogo: UIImageView = {
       let appLogo = UIImageView()
        appLogo.image = UIImage(named: "appLogo")
        appLogo.layer.cornerRadius = CGFloat(10)
        appLogo.clipsToBounds = true
        
        return appLogo
    }()
    
    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.black, titleColor: UIColor.white, imageName: "")
    private let signUpBtn = CustomButton(text: "회원가입", bgColor: UIColor.white, titleColor: UIColor.black, imageName: "")
    
    
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
        
        appTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalToSuperview().inset(150)
        }
        
        appTitle2.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalTo(appTitle).offset(45)
        }
        
        appLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(170)
            $0.top.equalToSuperview().offset(310)
            $0.width.height.equalTo(80)
        }
         
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
        self.view.addSubview(appTitle)
        self.view.addSubview(appTitle2)
        self.view.addSubview(appLogo)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
        setLayout()
        
        loginBtn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
        
    }

}
