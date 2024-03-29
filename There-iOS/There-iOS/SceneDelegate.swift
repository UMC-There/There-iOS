//
//  SceneDelegate.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import UIKit
import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 윈도우의 씬을 가져온다
        guard let windowScene = (scene as? UIWindowScene) else {return}
        // 윈도우 씬 설정
        window = UIWindow(windowScene: windowScene)
        // 설정한 윈도우를 보이게 끔 설정
        window?.makeKeyAndVisible()
        
        
        // 뷰 컨트롤러 인스턴스 생성
        let initialVC = InitialViewController(bgColor: UIColor.white)
        // 루트 네비게이션 컨트롤러 설정
        let navVC = UINavigationController(rootViewController: initialVC)
        // 뿌리 뷰컨트롤러를 위에서 설정한 네비게이션 컨트롤러로 설정
        window?.rootViewController = navVC
        // Light mode -> white, Dark mode -> black으로 설정됨
        window?.tintColor = .label
        
    }

    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

