//
//  MoreViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class MoreViewController: UIViewController {

    convenience init(title: String, bgColor: UIColor) {
            self.init()
            self.title = title
            self.view.backgroundColor = bgColor
    }
    
    var stackView: UIStackView!
    
    func setupPostStackView() {
        
    }
    func setEntireStackView() {
        self.stackView = UIStackView(arrangedSubviews: [])
        self.stackView.axis = .vertical
        self.stackView.distribution = .equalCentering
        self.stackView.alignment = .leading
        self.stackView.spacing = 10
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        }

  

}
