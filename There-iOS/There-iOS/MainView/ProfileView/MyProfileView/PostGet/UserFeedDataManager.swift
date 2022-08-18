//
//  UserFeedDataManager.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/11.
//

import Alamofire

class UserFeedDataManager{
    //MARK: 유저 피드 조회 API
    func getUserFeed(_ viewController : MypageViewController,
                     _ postIdx: Int32
                     ){
        //통신
        AF.request("https://3.39.57.176:8080/posts/\(postIdx)",
                   method: .get,
                   parameters: postIdx)
            .validate()
            .responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case.success(let result):
                print ("success")
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
