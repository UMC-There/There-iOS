//
//  ChattingRoomViewControlelr.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/18.
//

import Foundation
import UIKit

class ChattingRoomViewController: UIViewController {
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
        self.navigationItem.title = "닉네임"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
