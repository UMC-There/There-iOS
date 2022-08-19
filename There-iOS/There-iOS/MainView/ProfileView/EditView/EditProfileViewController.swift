//
//  EditProfileViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/19.
//

import UIKit
import SnapKit


class EditProfileViewController: UIViewController {
    
    // MARK: - Init
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    private let uploadImage: UIImage
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: UploadViewController.self, action: #selector(imgPick))
    
    private lazy var profileImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "person")
        
        return image
    }()

    private lazy var imageChangeLabel: UILabel = {
        let label = UILabel()
        label.text = "사진 변경"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var editName: UITextField = {
       let text = UITextField()
        text.placeholder = "작가이름을 입력하세요."
        text.font = .systemFont(ofSize: 17, weight: .medium)
        
        return text
    }()
    
    private lazy var underLineView1: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.systemGray
        
        return lineView
    }()
    
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "계정명"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var editAccount: UITextField = {
        let text = UITextField()
         text.placeholder = "계정명을 입력하세요."
         text.font = .systemFont(ofSize: 17, weight: .light)
         
         return text
    }()
    
    private lazy var underLineView2: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.systemGray
        
        return lineView
    }()
    

    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true //수정권한 추가
        imagePickerController.delegate = self
        
        return imagePickerController
    }()
    
    
    // MARK: - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        setUpLayOut()

    }
}




//image upload
extension EditProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate { //imagepicker 델리게이트를 따를 때 반드시 navigation delegate 따라야한다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //media를 pick했을 때 할 수 있는 동작 구현 -> 게시물 작성 화면으로 넘기기
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectImage = editedImage
        }//info: pick한 정보를 가지고 있는 딕셔너리
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectImage = originalImage
        }
        
        print(selectImage)
        
        picker.dismiss(animated: true) { [weak self] in //메모리위해 ..뒤에 self?
            let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            //navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
            
        }//imagePicker 창닫고, completion: 게시물 작성창으로 넘김
    }
}


//작품설명
extension EditProfileViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
}

private extension EditProfileViewController{
    func setUpNavigationBar() {
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeView))
        cancelButton.tintColor = .black
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationItem.title = "프로필 편집"
        
        let didButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didEditProfile))

        didButton.tintColor = .black
        navigationItem.rightBarButtonItem = didButton
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
    
    @objc func didEditProfile(){
        print("upload")
        dismiss(animated: true)
    }
    
    @objc func imgPick(){
        present(imagePickerViewController, animated: true)
    }
    
    func setUpLayOut(){
        
        
        
        [
            profileImage,
            imageChangeLabel,
            nameLabel,
            editName,
            underLineView1,
            accountLabel,
            editAccount,
            underLineView2
            
        ].forEach{view.addSubview($0)}
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        imageChangeLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(imageChangeLabel).offset(40)
        }
        editName.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        underLineView1.snp.makeConstraints{
            $0.top.equalTo(editName.snp.bottom).offset(3.0)
            $0.leading.equalTo(editName.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        accountLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.top.equalTo(underLineView1.snp.bottom).offset(30)
        }

        editAccount.snp.makeConstraints {
            $0.leading.equalTo(accountLabel)
            $0.top.equalTo(accountLabel.snp.bottom).offset(10)
        }
        
        underLineView2.snp.makeConstraints {
            $0.top.equalTo(editAccount.snp.bottom).offset(3.0)
            $0.leading.equalTo(editAccount.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
    }
    
    
    
}


