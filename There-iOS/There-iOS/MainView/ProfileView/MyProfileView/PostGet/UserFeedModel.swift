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
    var result: FeedResult
}

struct FeedResult: Codable {
    var getUserPosts: [GetUserPosts]
    var getUserRes: GetUserRes
}

struct GetUserPosts: Codable {
    let imgUrl: String?
    let postIdx: Int?
    let isSelected: Bool? //선택해서 post detail로 들어가는 경우 추가
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
