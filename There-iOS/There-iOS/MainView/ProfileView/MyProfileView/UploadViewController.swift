//
//  UploadViewController.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/02.
//

import SnapKit
import UIKit
import Kingfisher


final class UploadViewController: UIViewController {
    
    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "작품명"
        label.font = .systemFont(ofSize: 15.0)
        return label
    }()

    private lazy var postTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "작품명을 입력하세요."
        return textField
    }()
    
    private lazy var underLineView1: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .black
        
        return lineView
    }()
    
    
    //private let selectImgImage = UIImage(systemName: "fold")
    
    private lazy var selectButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사진선택", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.contentHorizontalAlignment = .center
    
        
        button.addTarget(self, action: #selector(imgPick), for: .touchUpInside)
        
        return button
    }()
    
   

    private lazy var uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return imageView
    }()
    
    public let uploadImage: UIImage
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true //수정권한 추가
        imagePickerController.delegate = self
        
        return imagePickerController
    }()
    
    private lazy var postIntroLabel : UILabel = {
        let label = UILabel()
        label.text = "작품설명"
        label.font = .systemFont(ofSize: 15.0)
        return label
    }()
    
    private lazy var introImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return imageView
    }()
    
    private lazy var postIntroTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "해당 작품에 대한 설명을 작성합니다." //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        
        return textView
    }()
    
    private lazy var hashTagTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "해시태그를 입력하세요."
        return textField
    }()
    
    private lazy var underLineView2: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .label
        
        return lineView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        setUpLayOut()
        
        uploadImageView.image = uploadImage
        /*if uploadImage != UIImage() {
            self.selectButton.isHidden = true
         }*/
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
            //navigationBar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
}




//image upload
extension UploadViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate { //imagepicker 델리게이트를 따를 때 반드시 navigation delegate 따라야한다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //media를 pick했을 때 할 수 있는 동작 구현 -> 게시물 작성 화면으로 넘기기
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectImage = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectImage = originalImage
        }
        self.uploadImageView.image = selectImage ?? UIImage()
        
        picker.dismiss(animated: true){
            self.selectButton.isHidden = true
        }
    }
}


//작품설명
extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
    
    //return 키 -> 키보드 내려가도록
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

private extension UploadViewController{
    func setUpNavigationBar() {
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeView))
        cancelButton.tintColor = .black
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationItem.title = "게시글"
        
        let didButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didUploadPost))
        //didButton.tintColor = .black
        navigationItem.rightBarButtonItem = didButton
    }
    
    @objc func closeView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didUploadPost() -> UIImage{
        self.navigationController?.popViewController(animated: true)
        return (uploadImage)
        
    }
    
    @objc func imgPick(){
        self.present(self.imagePickerViewController, animated: true)
    }
    
    func setUpLayOut(){
        
        [postTitleLabel, postTitleTextField, underLineView1, uploadImageView, selectButton, postIntroLabel,introImageView, postIntroTextView, hashTagTextfield, underLineView2].forEach{view.addSubview($0)}
        
        let inset: CGFloat = 16.0
        
        postTitleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
        }
        
        postTitleTextField.snp.makeConstraints{
            $0.top.equalTo(postTitleLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(postTitleLabel.snp.leading)
        }
        
        underLineView1.snp.makeConstraints{
            $0.top.equalTo(postTitleTextField.snp.bottom).offset(1.0)
            $0.leading.equalTo(postTitleLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
            $0.height.equalTo(1)
        }
        
        uploadImageView.snp.makeConstraints{
            $0.top.equalTo(underLineView1.snp.bottom).offset(inset)
            $0.leading.equalTo(postTitleLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
            $0.height.equalTo(300)
    
        }
        
        selectButton.snp.makeConstraints{
            $0.centerX.equalTo(uploadImageView.snp.centerX)
            $0.centerY.equalTo(uploadImageView.snp.centerY)

            
        }
        
        postIntroLabel.snp.makeConstraints{
            $0.top.equalTo(uploadImageView.snp.bottom).offset(inset)
            $0.leading.equalTo(postTitleLabel.snp.leading)
        }
        
        introImageView.snp.makeConstraints{
            $0.top.equalTo(postIntroLabel.snp.bottom).offset(1.0)
            $0.leading.equalTo(postTitleLabel.snp.leading)
            $0.trailing.equalTo(uploadImageView.snp.trailing)
            $0.height.equalTo(180)
        }
        
        postIntroTextView.snp.makeConstraints{
            $0.top.equalTo(introImageView.snp.top).offset(1.0)
            $0.leading.equalTo(introImageView.snp.leading).offset(1.0)
            $0.trailing.equalTo(introImageView.snp.trailing).inset(1.0)
            $0.bottom.equalTo(introImageView.snp.bottom).inset(1.0)
        }
        
        hashTagTextfield.snp.makeConstraints{
            $0.top.equalTo(postIntroTextView.snp.bottom).offset(inset)
            $0.leading.equalTo(postTitleLabel.snp.leading)
        }
        
        underLineView2.snp.makeConstraints{
            $0.top.equalTo(hashTagTextfield.snp.bottom).offset(1.0)
            $0.leading.equalTo(hashTagTextfield.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
            $0.height.equalTo(1)
        }
    
    }
    
    
    
}

