//
//  MypageViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit
import SnapKit
import Then

class MypageViewController: UIViewController{
    
    convenience init(bgColor: UIColor) {
            self.init()
            view.backgroundColor = bgColor
        }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "작가이름"
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "이곳에 개인 설명을 작성합니다"
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.numberOfLines = 0 //아무리 글자가 많아지더라도 계속 화면에 보이도록
        
        return label
    }()
    
    private lazy var artistNoteButton: UIButton = {
        let button = UIButton()
        button.setTitle("작가노트", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .medium)
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 15.0
        
        return button
    }()
    
    
    private lazy var EditProfileButton: UIButton = {
        var button = UIButton()
        button.setTitle("프로필편집", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .medium)
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 15.0
        
        return button
    }()

    private let followerDataView = ProfileDataView(title:"팔로워", count:1111)
    private let followingDataView = ProfileDataView(title:"팔로우", count:12)
    
    
    private let segmentedControl: UISegmentedControl = {
        let postSectionImage = UIImage(systemName: "square.grid.2x2")
        let porfolSectionImage = UIImage(systemName: "folder")
        
        let control = UISegmentedControl(items:[postSectionImage ?? UIImage(),porfolSectionImage! ])
       control.translatesAutoresizingMaskIntoConstraints = false
       return control
     }()
    
     let firstView: UIView = {
       let view = UIView()
       view.backgroundColor = .green
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
     }()
    
     let secondView: UIView = {
       let view = UIView()
       view.backgroundColor = .yellow
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
     }()
     
     var shouldHideFirstView: Bool? {
       didSet {
         guard let shouldHideFirstView = self.shouldHideFirstView else { return }
         self.firstView.isHidden = shouldHideFirstView
         self.secondView.isHidden = !self.firstView.isHidden
       }
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLayOut()
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.firstView)
        self.view.addSubview(self.secondView)
         
        
        NSLayoutConstraint.activate([
            self.firstView.leftAnchor.constraint(equalTo: self.segmentedControl.leftAnchor),
            self.firstView.rightAnchor.constraint(equalTo: self.segmentedControl.rightAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            self.firstView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 16),
            ])
        NSLayoutConstraint.activate([
            self.secondView.leftAnchor.constraint(equalTo: self.firstView.leftAnchor),
            self.secondView.rightAnchor.constraint(equalTo: self.firstView.rightAnchor),
            self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
            self.secondView.topAnchor.constraint(equalTo: self.firstView.topAnchor),
            ])
        
            
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
          }
         
          
    @objc private func didChangeValue(segment: UISegmentedControl) {
            self.shouldHideFirstView = segment.selectedSegmentIndex != 0
          }
      

}





private extension MypageViewController{
    func setUpNavigationBar(){
       
        let userID = UILabel()
        userID.textColor = .black
        userID.text = "계정명"
        userID.font = UIFont(name: "Plain", size:30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userID)
            
        

        let uploadButton = UIButton(type:.custom)
        uploadButton.setImage(UIImage(systemName: "plus"), for: .normal)
        uploadButton.tintColor = .black
        //uploadButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        let upload = UIBarButtonItem(customView: uploadButton)
        upload.customView?.translatesAutoresizingMaskIntoConstraints = false
        upload.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        upload.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
               
        navigationItem.rightBarButtonItem = upload

        /*
    @objc func buttonTapped(sender: UIButton){
        print("post작성화면으로 넘어가기")
    }
         */
    }
    
    func setUpLayOut(){
        let buttonStackView = UIStackView(arrangedSubviews: [artistNoteButton,EditProfileButton])
        buttonStackView.spacing = 4.0
        buttonStackView.distribution = .fillProportionally
        
        let dataStackView = UIStackView(arrangedSubviews: [followerDataView,followingDataView])
        dataStackView.spacing = 12.0
        
    
        
        [profileImageView, nameLabel, dataStackView, descriptionLabel, buttonStackView, segmentedControl].forEach{view.addSubview($0)}
        
        let inset: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        dataStackView.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            //$0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileImageView.snp.centerY) //중앙정렬
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.trailing.equalTo(descriptionLabel.snp.trailing)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(buttonStackView.snp.bottom).offset(6.0)
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.trailing.equalTo(descriptionLabel.snp.trailing)
        }
        
       
    }
    
 
    

}

    
