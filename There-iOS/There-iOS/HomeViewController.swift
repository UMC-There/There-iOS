//
//  HomeViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    
    // MARK: Initialization
    convenience init(bgColor: UIColor) {
            self.init()
            view.backgroundColor = bgColor
        }

    // MARK: Property
    var stackView: UIStackView!
    var userInfoStackView: UIStackView!
    var iconsStackView: UIStackView!
        
    let postImage = UIImageView(image: UIImage(named: "1"))
    
    // MARK: Function
    func setUserInfoStackView() {
        
        let userImage = UIImageView(image: UIImage(systemName:"person.circle.fill"))
        userImage.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.height.equalTo(60.0)
            $0.width.equalTo(60.0)
        }
        
        let userName = UILabel()
        userName.text = "사용자명"
        userName.then {
            $0.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
            $0.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        }
        let moreBtn = UIImageView(image: UIImage(systemName: "ellipsis"))
        moreBtn.then  {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.width.equalTo(40.0)
        }
        
        self.userInfoStackView = UIStackView(arrangedSubviews: [userImage, userName, moreBtn])
        self.userInfoStackView.axis = .horizontal
        self.userInfoStackView.distribution = .equalSpacing
        self.userInfoStackView.alignment = .center
        self.userInfoStackView.spacing = 97
//        self.userInfoStackView.backgroundColor = .blue
        self.userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        

    }
    
    func setIconsStackView() {
        let heartBtn: UIImageView = UIImageView(image: UIImage(systemName: "heart"))
        heartBtn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
        let commentBtn: UIImageView = UIImageView(image: UIImage(systemName: "message"))
        commentBtn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
        let messageBtn: UIImageView = UIImageView(image: UIImage(systemName: "paperplane"))
        messageBtn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
        
        self.iconsStackView = UIStackView(arrangedSubviews: [heartBtn, commentBtn, messageBtn])
        self.iconsStackView.axis = .horizontal
        self.iconsStackView.distribution = .fill
        self.iconsStackView.alignment = .fill
        self.iconsStackView.spacing = 10
        self.iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setEntireStackView () {
        
        setUserInfoStackView()
        setIconsStackView()

        
        self.stackView = UIStackView(arrangedSubviews: [userInfoStackView, postImage, iconsStackView])
        self.stackView.axis = .vertical
        self.stackView.distribution = .equalCentering
        self.stackView.alignment = .leading
        self.stackView.spacing = 10
//        self.stackView.backgroundColor = .yellow
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.stackView)
        
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.view.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 250).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 20).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setEntireStackView()
    
    }

}
