//
//  UploadDataManager.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/11.
//

import Alamofire
//게시물 생성
class UploadDataManager{
    func uploadDataManager(_ viewController: MypageViewController, _ parameter: UploadDataInput, _ userIdx: Int32){ //이거 맞나..
        AF.request("http://3.39.57.176:8080/posts/users/\(userIdx)",
                   method: .post,
                   parameters: parameter,
                   encoder:JSONParameterEncoder.default, headers: nil)
            .validate()
            .responseDecodable(of: UploadDataModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print(result)
                } else {
                
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

