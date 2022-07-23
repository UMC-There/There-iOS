//
//  SearchViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class SearchViewController: UIViewController {

    convenience init(title: String, bgColor: UIColor) {
            self.init()
            self.title = title
            self.view.backgroundColor = bgColor
        }
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }


}
