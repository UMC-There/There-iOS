//
//  ChargingListViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/19.
//

import UIKit

class ChargingListViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        self.navigationItem.title = "충전내역"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
