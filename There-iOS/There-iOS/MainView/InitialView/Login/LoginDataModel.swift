//
//  LoginDataModel.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/03.
//

import Foundation

struct LoginResponse: Codable {
    let isSuccess: Bool?
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let email: String
    let password: String
}
