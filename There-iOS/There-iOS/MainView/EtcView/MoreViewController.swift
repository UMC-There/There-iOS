//
//  MoreViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit

class MoreViewController: UIViewController {

    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        navigationItem.title = "Instagram"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
