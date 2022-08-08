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
    
    let uploadViewController = UINavigationController(rootViewController: UploadViewController(uploadImage: UIImage()))
    
    
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
    
    private lazy var postCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.minimumLineSpacing = 0.5
         layout.minimumInteritemSpacing = 0.5
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.backgroundColor = .systemBackground
         collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCollectionViewCell")
         collectionView.dataSource = self
         collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
         return collectionView
     }()
    
    private lazy var portfolioTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        
        //tableView.contentInset =  UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        
        tableView.register(PortfolioTableViewCell.self, forCellReuseIdentifier: "PortfolioTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false //중요!!!!
        
        return tableView
    }()
    
    //뷰 왔다갔다 할 때 사라지게 하기
     var shouldHideFirstView: Bool? {
       didSet {
         guard let shouldHideFirstView = self.shouldHideFirstView else { return }
         self.postCollectionView.isHidden = shouldHideFirstView
         self.portfolioTableView.isHidden = !self.postCollectionView.isHidden
       }
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLayOut()
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.postCollectionView)
        self.view.addSubview(self.portfolioTableView)
         
        
        NSLayoutConstraint.activate([
            self.postCollectionView.leftAnchor.constraint(equalTo: self.segmentedControl.leftAnchor),
            self.postCollectionView.rightAnchor.constraint(equalTo: self.segmentedControl.rightAnchor),
            self.postCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            self.postCollectionView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 16),
            ])
        NSLayoutConstraint.activate([
            self.portfolioTableView.leftAnchor.constraint(equalTo: self.postCollectionView.leftAnchor),
            self.portfolioTableView.rightAnchor.constraint(equalTo: self.postCollectionView.rightAnchor),
            self.portfolioTableView.bottomAnchor.constraint(equalTo: self.postCollectionView.bottomAnchor),
            self.portfolioTableView.topAnchor.constraint(equalTo: self.postCollectionView.topAnchor),
            ])
        
            
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
          }
         
          
    @objc private func didChangeValue(segment: UISegmentedControl) {
            self.shouldHideFirstView = segment.selectedSegmentIndex != 0
          }
      

}





//CollectionView DataSource, Delegete : post
extension MypageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as? PostCollectionViewCell
        
        cell?.setup(with: UIImage()) //named:"asset name" 하면 이미지 띄울 수 있음
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //무한대로 생성가능하게
    }
    
}

extension MypageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width / 3) - 1.0
        return CGSize(width: width, height: width)
    }
}


//TableView DataSource, Delegate: portfolio
extension MypageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //아이템 무한 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioTableViewCell", for: indexPath) as? PortfolioTableViewCell
        cell?.selectionStyle = .none
        cell?.setUp()
        
        return cell ?? UITableViewCell()
    }
}

/*
extension MypageViewController: UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if scrollView.contentOffset.y < 0 {
                heightConstraint.constant = max(abs(scrollView.contentOffset.y), minHeight)
            } else {
                heightConstraint.constant = minHeight
            }
            let offset = -scrollView.contentOffset.y
            let percentage = (offset-100)/50
            upperHeaderView.alpha = percentage
        }
}
 */





private extension MypageViewController{
    
    func setUpNavigationBar(){
       
        let userID = UILabel()
        userID.textColor = .black
        userID.text = "계정명"
        userID.font = UIFont(name: "Plain", size:30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userID)
        
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapUploadButton))
        uploadButton.tintColor = .black
                                           
        let popUpButton = self.navigationItem.makeSFSymbolButton(self,
                                                                 action: Selector("popUp"),
                                                                  symbolName: "line.3.horizontal")
                    
        self.navigationItem.rightBarButtonItems = [popUpButton, uploadButton]
    }
    
    @objc func didTapUploadButton(){
       present(uploadViewController, animated: true)
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

    

