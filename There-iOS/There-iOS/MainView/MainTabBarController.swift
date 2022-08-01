//
//  MainTabBarController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/19.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray , alpha: 0.3, x: 0, y: 0, blur: 12)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()

        self.tabBar.backgroundColor = UIColor.white
        
        let homeNC = UINavigationController.init(rootViewController: HomeViewController(bgColor: UIColor.white))
        let searchNC = UINavigationController.init(rootViewController: SearchViewController(bgColor: UIColor.white))
        let chatNC = UINavigationController.init(rootViewController: ChatViewController(bgColor: UIColor.white))
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController(title: "마이페이지", bgColor: UIColor.white))
        let moreNC = UINavigationController.init(rootViewController: MoreViewController(bgColor: UIColor.white))
        
        self.viewControllers = [homeNC, searchNC, chatNC, mypageNC, moreNC]
        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
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


