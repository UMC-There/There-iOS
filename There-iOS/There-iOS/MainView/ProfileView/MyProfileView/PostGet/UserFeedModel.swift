//
//  FeedDataModel.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/18.
//

import Foundation
//parameter: userIdx

struct UserFeedModel: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: FeedResult
}

struct FeedResult: Codable {
    let getUserPosts: [GetUserPosts]
    let getUserRes: GetUserRes
}

struct GetUserPosts: Codable {
    let imgUrl: String?
    let postIdx: Int?
}

struct GetUserRes: Codable {
    let email: String
    let followeeIdx: Int
    let followerIdx: Int
    let info: String
    let name: String
    let nickName: String
    let profileImgUrl: String
    let userIdx: Int
}
