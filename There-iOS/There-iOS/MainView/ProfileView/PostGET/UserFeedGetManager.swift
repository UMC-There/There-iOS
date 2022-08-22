//
//  UserFeedGetManager.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/23.
//

import Foundation
import Alamofire

class UserFeedManager{
    //유저피드 조회
    let userIdx = 23
    
    func getUserFeed(_ viewController : MypageViewController, _ userIdx: Int32){
        AF.request("http://3.39.57.176:8080/users/feed/\(userIdx) ", method: .get, parameters: nil).validate().responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case .success(let result):
                viewController.successAPI(result)
                print("프로필&피드 조회 성공")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


