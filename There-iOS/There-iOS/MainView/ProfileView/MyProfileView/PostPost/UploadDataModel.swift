//
//  UploadDataModel.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/11.
//

import Foundation

struct UploadDataModel: Codable {
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: PostIdx?
}

struct PostIdx: Codable{
    let postIdx: Int?
}
