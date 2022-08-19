//
//  MoreViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//


import UIKit
import SnapKit
import Then

class MoreViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        navigationItem.title = "더보기"
    }

    // MARK: - Property
    


    private lazy var chargingAmountView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    
    private lazy var chargingTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20.0, weight: .light)
        title.text = "충전금액"
        title.textColor = .black
        
        
        return title
    }()
    
    private lazy var chargingMoney: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 40.0, weight: .medium)
        title.text = "10000원"
        title.textColor = .black
        
        return title
    }()
    

    private lazy var chargingBtn: UIButton = {
        let btn = CustomButton(text: "충전하기", bgColor: .white, titleColor: .darkGray, imageName: "")
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0

        
        return btn
    }()
    
    private lazy var purchaseHistoryBtn: UIButton = {
        let btn = CustomButton(text: "구매내역", bgColor: .white, titleColor: .darkGray, imageName: "")
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        btn.layer.borderWidth = 0
        btn.layer.cornerRadius = 17.0
        
        return btn
    }()
    
    private lazy var setting: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .light)
        label.text = "설정"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var settingBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.forward")
        
        return btn
    }()
    
    private lazy var settingView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.yellow
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor


       return view
    }()
    
    private lazy var customerService: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .light)
        label.text = "고객센터"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var customerServiceBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.forward")
        
        return btn
    }()
    
    private lazy var customerServiceView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.yellow
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor


       return view
    }()
    
    private lazy var contactUs: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .light)
        label.text = "문의하기"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var contactUsBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.forward")
        
        return btn
    }()
    
    private lazy var contactUsView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.yellow
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor


       return view
    }()
    
    
    // MARK: - Function
    
    
    @objc
    private func clickedCharge() {
        let charge = ChargeViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(charge, animated: false)
    }
    
 
    func setup() {
        [
            chargingTitle,
            chargingMoney,
            chargingBtn,
            purchaseHistoryBtn

        ].forEach { chargingAmountView.addSubview($0) }
        
        chargingAmountView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(90)
            $0.height.equalTo(220)
        }
        
        chargingTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(47)
        }
        
        chargingMoney.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(chargingTitle).offset(28)
        }
        
        chargingBtn.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(chargingMoney).offset(80)
        }
        
        purchaseHistoryBtn.snp.makeConstraints {
            $0.leading.equalTo(chargingBtn.snp.trailing).offset(20)
            $0.top.equalTo(chargingBtn)
        }
        
        settingView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(chargingAmountView.snp.bottom).offset(20)
        }
        
        [
            setting,
            settingBtn
        ].forEach{settingView.addSubview($0)}
    
        setting.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(chargingAmountView.snp.bottom).offset(20)
        }
        settingBtn.snp.makeConstraints {
            $0.leading.equalTo(setting.snp.trailing).offset(310)
            $0.top.equalTo(settingView.snp.top)
        }
        
        // customer
        
        customerServiceView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(setting.snp.bottom).offset(30)
        }
        
        [
            customerService,
            customerServiceBtn
        ].forEach{customerServiceView.addSubview($0)}
        
        customerService.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(settingView.snp.bottom).offset(50)
        }
        customerServiceBtn.snp.makeConstraints{
            $0.leading.equalTo(customerService.snp.trailing).offset(275)
            $0.top.equalTo(customerService.snp.top)
        }
        
        // contact
        
        contactUsView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(customerServiceView.snp.bottom).offset(30)
        }
        
        [
            contactUs,
            contactUsBtn
        ].forEach{contactUsView.addSubview($0)}
        
        contactUs.snp.makeConstraints {
            $0.leading.equalTo(chargingTitle)
            $0.top.equalTo(customerServiceView.snp.bottom).offset(50)
        }
        contactUsBtn.snp.makeConstraints{
            $0.leading.equalTo(contactUs.snp.trailing).offset(275)
            $0.top.equalTo(contactUs.snp.top)
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(chargingAmountView)
        view.addSubview(settingView)
        view.addSubview(customerServiceView)
        view.addSubview(contactUsView)

        chargingBtn.addTarget(self, action: #selector(clickedCharge), for: .touchUpInside)
        setup()

    }
}



