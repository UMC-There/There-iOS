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
        
        let homeNC = UINavigationController.init(rootViewController: HomeViewController(bgColor: UIColor.white))
        let searchNC = UINavigationController.init(rootViewController: SearchViewController(bgColor: UIColor.white))
        let chatNC = UINavigationController.init(rootViewController: ChatViewController(title: "채팅", bgColor: UIColor.white))
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController(title: "마이페이지", bgColor: UIColor.white))
        let moreNC = UINavigationController.init(rootViewController: MoreViewController(title: "기타", bgColor: UIColor.white))
        
        self.viewControllers = [homeNC, searchNC, chatNC, mypageNC, moreNC]
        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        let searchTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let chatTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "message"), tag: 2)
        let mypageTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 3)
        let moreTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "ellipsis"), tag: 4)
        
        homeNC.tabBarItem = homeTabBarItem
        searchNC.tabBarItem = searchTabBarItem
        chatNC.tabBarItem = chatTabBarItem
        mypageNC.tabBarItem = mypageTabBarItem
        moreNC.tabBarItem = moreTabBarItem
        
        
        
    }

}
