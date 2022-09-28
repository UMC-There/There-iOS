//
//  LoginDataModel.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation

struct LoginResponse: Codable {
    let code: Int
    let isSuccess: Bool?
    let message: String
    let result: LoginResult?
}

struct LoginData: Codable {
    let email: String
    let password: String
}

struct LoginResult: Codable {
    let jwt: String
    let userIdx: Int
}


