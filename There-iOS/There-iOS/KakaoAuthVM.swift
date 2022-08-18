//
//  KakaoAuthVM.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/14.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser


class KakaoAuthVM: ObservableObject {
    var subscriptions = Set<AnyCancellable>()

    static var password: String?
    static var email: String?
    static var accessToken: String!
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        print("KakaoAuthVM - init() called")
    }
    
    // 카카오톡 앱으로 로그인 인증
    func kakaoLoginWithApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    // 카카오 계정으로 로그인
    func kakaoLoginWithAccount() async -> Bool{
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                        self.getUsrInfo()
                    }
                }
        }
    }
    

    private func getUsrInfo() {
        // 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")

                // 사용자정보 가져오기
                KakaoAuthVM.email = user?.kakaoAccount?.email
            }
        }
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
            if let error = error {
                print(error)
            } else {
                KakaoAuthVM.accessToken = oauthToken?.accessToken
                KakaoAuthVM.accessToken = String(KakaoAuthVM.accessToken!)
            }
        }
        
        LoginService.shared.kakaoLogin(accessToken: KakaoAuthVM.accessToken) {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else {return}
                print("hollyshit")
                print(data.result?.jwt)
//                self.alert(message: data.message)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    
    @MainActor
    func kakaoLogin() {
        print("KakaoAuthVM - handleKakaoLogin() called")
        Task{
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카카오톡 앱으로 로그인 인증
                isLoggedIn = await kakaoLoginWithApp()
            } else { // 카톡이 설치 안되어 있으면
                // 카카오 계정으로 로그인
                isLoggedIn = await kakaoLoginWithAccount()
            }
        }

    } // login
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                self.isLoggedIn = false
            }
        }
    }
    
    
    func handleKakaoLogout() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }

    }
}
