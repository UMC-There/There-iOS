//
//  ChargeViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/18.
//

import UIKit
import SnapKit

class ChargeViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        self.navigationItem.title = "충전하기"
    }
    
    // MARK: - Property
    
    private lazy var myMoney: UILabel = {
       let myMoney = UILabel()
       
        myMoney.textColor = .label
        myMoney.font = .systemFont(ofSize: 20.0, weight: .light)
        myMoney.text = "내 충전금액 100,000원"
        
        return myMoney
    }()
    
    private lazy var chargingDetail: UIButton = {
        
        let btn = UIButton()
        
        btn.setTitle("충전내역", for: .normal)
        btn.setTitleColor(UIColor.systemGray, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .light)
        
        return btn
    }()
    
    private lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "chevron.forward")
        btn.tintColor = UIColor.systemGray
        
        return btn
    }()
    
    private lazy var amountBeCharged: UITextField = {
        let text = "충전할 금액 (원) \t\t\t\t\t\t "
       let amount = CustomTextField(text: text)
        
        amount.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25)
        amount.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 208, green: 213, blue: 221)])
                           
        let border = CALayer()
        border.frame = CGRect(x: 0,  y: amount.frame.size.height-1, width: amount.frame.width/1.1, height: 1)
        border.borderWidth = 1
        border.backgroundColor = UIColor.red.cgColor
        amount.layer.addSublayer(border)
        
        return amount
    }()
    
    private lazy var warningView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        
        return view
    }()
    
    private lazy var warningPhrase1: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13.0, weight: .light)
        label.text = "충전 금액은 마지막 이용일로부터 5년이 경과한 후, 1년 동안 해당 서비스에 접속하지 않은 경우 소멸됩니다."
        
        return label
    }()
    
    private lazy var warningPhrase2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13.0, weight: .light)
        label.text = "앱 내 결제로 충전한 금액은 결제일로부터 7일 이내에 고객센터에\n서 환불이 가능합니다."
        
        return label
    }()
    
    private lazy var warningPhrase3: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.font = .systemFont(ofSize: 13.0, weight: .light)
        label.text = "자세한 사항은 이용약관을 참고 부탁드립니다."
        
        return label
    }()
    
    
    private lazy var chargeBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("충전하기", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 22.0, weight: .medium)
        
        return btn
    }()

    // MARK: - Function
    
    
    @objc
    private func clickedChargingList() {
        let chargingList = ChargingListViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(chargingList, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [
            myMoney,
            chargingDetail,
            rightBtn,
            amountBeCharged,
            warningView,
            chargeBtn
            
        ].forEach {
            self.view.addSubview($0)
        }
        setup()
        chargingDetail.addTarget(self, action: #selector(clickedChargingList), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

}

// MARK: - Extension

extension ChargeViewController {
    func setup() {
        
        let basicOffset = 20
        
        myMoney.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.equalToSuperview().offset(basicOffset)
        }
        
        chargingDetail.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
            $0.leading.equalTo(myMoney.snp.trailing).offset(95)
        }
        
        rightBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.equalTo(myMoney.snp.trailing).offset(160)
        }
        
        amountBeCharged.snp.makeConstraints {
            $0.top.equalTo(myMoney.snp.bottom).offset(80)
            $0.leading.equalToSuperview().offset(basicOffset)
        }
        
        warningView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(amountBeCharged.snp.bottom).offset(250)
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        chargeBtn.snp.makeConstraints {
            $0.top.equalTo(warningView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(90)
        }
        
        [
            warningPhrase1,
            warningPhrase2,
            warningPhrase3
            
        ].forEach{warningView.addSubview($0)}
        
        warningPhrase1.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalTo(warningView.snp.top).offset(basicOffset)
            
        }
        
        warningPhrase2.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalTo(warningPhrase1.snp.bottom).offset(basicOffset)
        }
        
        warningPhrase3.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(basicOffset)
            $0.trailing.equalToSuperview().offset(basicOffset)
            $0.top.equalTo(warningPhrase2.snp.bottom).offset(basicOffset)
        }
        
    }
}

