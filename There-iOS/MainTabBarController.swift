//
//  MainTabBarController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.backgroundColor = UIColor.white
        
        let homeNC = UINavigationController.init(rootViewController: HomeViewController(title: "홈", bgColor: UIColor.white))
        let searchNC = UINavigationController.init(rootViewController: SearchViewController(title: "검색", bgColor: UIColor.white))
        let chatNC = UINavigationController.init(rootViewController: ChatViewController(title: "채팅", bgColor: UIColor.white))
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController(title: "마이페이지", bgColor: UIColor.white))
        let moreNC = UINavigationController.init(rootViewController: MoreViewController(title: "기타", bgColor: UIColor.white))
        
        self.viewControllers = [homeNC, searchNC, chatNC, mypageNC, moreNC]
        
        let homeTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        let searchTabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let chatTabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message"), tag: 2)
        let mypageTabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 3)
        let moreTabBarItem = UITabBarItem(title: "기타", image: UIImage(systemName: "ellipsis"), tag: 4)
        
        homeNC.tabBarItem = homeTabBarItem
        searchNC.tabBarItem = searchTabBarItem
        chatNC.tabBarItem = chatTabBarItem
        mypageNC.tabBarItem = mypageTabBarItem
        moreNC.tabBarItem = moreTabBarItem
        
        
        
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
