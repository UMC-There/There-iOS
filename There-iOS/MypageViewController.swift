//
//  MypageViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit
import SnapKit
import Then

class MypageViewController: UIViewController {
    convenience init(bgColor: UIColor) {
            self.init()
            view.backgroundColor = bgColor
        }

    
    //collectionView 선언
    let myPageCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        
        
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        
        }

}

private extension MypageViewController{
    func setUpNavigationBar(){
       
        let userName = UILabel()
        userName.textColor = .black
        userName.text = "계정명"
        userName.font = UIFont(name: "Plain", size:30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userName)
            
        

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
}

    
