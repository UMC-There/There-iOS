//
//  MypageViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class MypageViewController: UIViewController {

    convenience init(title: String, bgColor: UIColor) {
            self.init()
            self.title = title
        self.view.backgroundColor = bgColor
        }
    
    lazy var userName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "계정명"
        name.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
        name.snp.makeConstraints {
            $0.width.equalTo(100).priority(999)
            
        }
        return name
    }()
    
    lazy var menuBtn: UIImageView = {
        let more = UIImageView(image: UIImage(systemName: "text.justifyleft"))
        more.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
//                $0.height.equalTo(60.0)
            $0.width.equalTo(30.0)
        }
        return more
    }()
    
    
    lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userName, menuBtn])
        stackView.axis = .horizontal // default
        stackView.distribution = .fill // default
        stackView.alignment = .fill // default
        view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25.0)
            $0.right.equalToSuperview().offset(-25.0)
            $0.height.equalTo(80)
        }

        return stackView
    }()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    

 
}
