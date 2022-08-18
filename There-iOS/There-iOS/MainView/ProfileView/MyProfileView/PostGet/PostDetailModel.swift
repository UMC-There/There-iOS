//
//  UserFeedModel.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/11.
//

import Foundation

struct PostDetailModel: Codable {
    let code: Int
    let isSuccess: Bool?
    let message: String?
    let result: Result?
}

struct Result: Codable {
    let content: String?
    let getPostTagist: [GetPostTagist]?
    let imgURL : String?
    let likeCount: Int?
    let nickName: String?
    let postIdx: Int?
    let profileImgUrl: String?
}

struct GetPostTagist: Codable {
    let name : String?
}
