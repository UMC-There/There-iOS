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
        $0.font = UIFont.boldSystemFont(ofSize: 40.0)
    }

    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0),
                                        titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    
    // MARK: - Function
    
    func setLayout() {
        self.labelView = UIView()
        self.labelView.addSubview(label)
        
//        self.labelView.topAnchor.constraint(equalTo: self.safeView.topAnchor).isActive = true
//        self.labelView.leadingAnchor.constraint(equalTo: self.safeView.leadingAnchor, constant: 20).isActive = true
//        self.labelView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 250).isActive = true
//        self.labelView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 20).isActive = true
        
    
        self.view.addSubview(labelView)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        self.view.addSubview(label)
    }


}
