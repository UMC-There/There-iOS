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

    convenience init(bgColor: UIColor) {
            self.init()
            view.backgroundColor = bgColor
        }

    lazy var userImage: UIImageView = {
            let image = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        image.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
            $0.height.equalTo(60.0)
            $0.width.equalTo(60.0)
        }
            return image
        }()

        lazy var userName: UILabel = {
            let name = UILabel()
            name.textColor = .black
            name.text = "사용자명"
            name.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
            name.snp.makeConstraints {
                $0.width.equalTo(100).priority(999)
                
            }
            return name
        }()
    lazy var heartBtn: UIImageView = {
            let btn = UIImageView(image: UIImage(systemName: "heart"))
        btn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
            return btn
        }()
    lazy var commentBtn: UIImageView = {
            let btn = UIImageView(image: UIImage(systemName: "message"))
        btn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
            return btn
        }()
    
    lazy var messageBtn: UIImageView = {
            let btn = UIImageView(image: UIImage(systemName: "paperplane"))
        btn.then {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints{
            $0.height.equalTo(30.0)
            $0.width.equalTo(30.0)
        }
            return btn
        }()

        lazy var moreBtn: UIImageView = {
            let more = UIImageView(image: UIImage(systemName: "ellipsis"))
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
        let stackView = UIStackView(arrangedSubviews: [userImage, userName, moreBtn])
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
    
    
    lazy var postView: UIImageView = {
        let postImage = UIImageView(image: UIImage(systemName: "squareshape.split.2x2"))
        view.addSubview(postImage)
        postImage.then {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.tintColor = .darkGray
        }.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60.0)
            $0.left.equalToSuperview().offset(25.0)
            $0.right.equalToSuperview().offset(-25.0)
            $0.height.equalTo(400)
            $0.width.equalTo(650)
        }
        return postImage
    }()
    
    
    lazy var btnsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartBtn, commentBtn, messageBtn])
        stackView.axis = .horizontal // default
        stackView.distribution = .fill // default
        stackView.alignment = .firstBaseline // default
        view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(450.0)
            $0.left.equalToSuperview().offset(25.0)
            $0.right.equalToSuperview().offset(-25.0)
            
        }
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(userInfoStackView.arrangedSubviews)
        print(postView)
        print(btnsStackView.arrangedSubviews)
    }

}
