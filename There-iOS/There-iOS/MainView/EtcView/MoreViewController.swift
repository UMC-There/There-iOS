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
}



