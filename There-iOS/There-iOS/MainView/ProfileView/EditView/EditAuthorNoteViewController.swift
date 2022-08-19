//
//  EditAuthorNoteViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/19.
//

import UIKit
import SnapKit
import SwiftUI

class EditAuthorNoteViewController: UIViewController {
    
    // MARK: - Init
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private let uploadImage: UIImage

    let tapGestureRecognizer = UITapGestureRecognizer(target: UploadViewController.self, action: #selector(imgPick))
    
    private lazy var authorIntroduceLabel: UILabel = {
        let label = UILabel()
        label.text = "자기소개"
        label.font = .systemFont(ofSize: 15.0)
        return label
    }()

    private lazy var editView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return view
    }()
    
    private lazy var authorIntroduceTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "이곳에 자신의 학위 혹은 기타 자기 소개글을 입력합니다." //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        
        return textView
    }()
    

    private lazy var workIntroduceLabel: UILabel = {
        let label = UILabel()
        label.text = "추구하는 작품 소개"
        label.font = .systemFont(ofSize: 15.0)
        return label
    }()
    
    private lazy var editView2: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return view
    }()
    
    private lazy var workIntroduceTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "이곳에 작품 소개 글을 올리거나 평소 작업에 대한 생각을 정리합니다." //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        
        return textView
    }()
    

    
    private lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.text = "연락처"
        label.font = .systemFont(ofSize: 15.0)
        return label
    }()
    
    private lazy var editView3: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return view
    }()

    private lazy var contactTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "이메일 혹은 전화번호를 입력합니다." //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        
        return textView
    }()
    

    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true //수정권한 추가
        imagePickerController.delegate = self
        
        return imagePickerController
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        setUpLayOut()
    
    }
}




//image upload
extension EditAuthorNoteViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate { //imagepicker 델리게이트를 따를 때 반드시 navigation delegate 따라야한다.
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
extension EditAuthorNoteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = nil
        textView.textColor = .label
    }
}

private extension EditAuthorNoteViewController{
    func setUpNavigationBar() {
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeView))
        cancelButton.tintColor = .black
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationItem.title = "작가노트"
        
        let didButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didUploadPost))

        didButton.tintColor = .black
        navigationItem.rightBarButtonItem = didButton
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
    
    @objc func didUploadPost(){
        print("upload")
        dismiss(animated: true)
    }
    
    @objc func imgPick(){
        present(imagePickerViewController, animated: true)
    }
    
    func setUpLayOut(){
        
        let inset: CGFloat = 16.0
        
        [
            authorIntroduceLabel,
            editView,
            authorIntroduceTextView,
            workIntroduceLabel,
            editView2,
            workIntroduceTextView,
            contactLabel,
            editView3,
            contactTextView,
            
        ].forEach{view.addSubview($0)}
        
        
        authorIntroduceLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
        
        editView.snp.makeConstraints{
            $0.top.equalTo(authorIntroduceLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(authorIntroduceLabel.snp.leading)
            $0.trailing.equalTo(authorIntroduceLabel.snp.trailing)
            $0.height.equalTo(180)
        }
        
        authorIntroduceTextView.snp.makeConstraints {
            $0.top.equalTo(editView.snp.top).offset(1.0)
            $0.leading.equalTo(editView.snp.leading).offset(1.0)
            $0.trailing.equalTo(editView.snp.trailing).inset(1.0)
            $0.bottom.equalTo(editView.snp.bottom).inset(1.0)
        }
        
        workIntroduceLabel.snp.makeConstraints {
            $0.top.equalTo(editView.snp.bottom).offset(inset)
            $0.leading.equalTo(authorIntroduceLabel)
        }
        
        editView2.snp.makeConstraints{
            $0.top.equalTo(workIntroduceLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(workIntroduceLabel.snp.leading)
            $0.trailing.equalTo(authorIntroduceLabel.snp.trailing)
            $0.height.equalTo(180)
        }
        
        workIntroduceTextView.snp.makeConstraints {
            $0.top.equalTo(editView2.snp.top).offset(1.0)
            $0.leading.equalTo(editView2.snp.leading).offset(1.0)
            $0.trailing.equalTo(editView2.snp.trailing).inset(1.0)
            $0.bottom.equalTo(editView2.snp.bottom).inset(1.0)
        }

        contactLabel.snp.makeConstraints{
            $0.top.equalTo(editView2.snp.bottom).offset(inset)
            $0.leading.equalTo(authorIntroduceLabel)
        }
        
        editView3.snp.makeConstraints {
            $0.top.equalTo(contactLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(contactLabel.snp.leading)
            $0.trailing.equalTo(authorIntroduceLabel.snp.trailing)
            $0.height.equalTo(35)
        }
        
        contactTextView.snp.makeConstraints {
            $0.top.equalTo(editView3.snp.top).offset(1.0)
            $0.leading.equalTo(editView3.snp.leading).offset(1.0)
            $0.trailing.equalTo(editView3.snp.trailing).inset(1.0)
            $0.bottom.equalTo(editView3.snp.bottom).inset(1.0)
        }
        
    
    }
    
    
    
}

