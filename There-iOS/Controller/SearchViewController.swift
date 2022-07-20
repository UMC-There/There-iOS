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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
