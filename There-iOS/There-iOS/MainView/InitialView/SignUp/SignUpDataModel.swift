//
//  SignUpDataModel.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/03.
//

import Foundation

struct SingUpResponse: Codable {
    let status: Int
    let isSuccess: Bool?
    let message: String
    let data: SignUpData?
    // 로그인 성공 시 data가 넘어오고, 실패 시 data가 안넘어옴
}

struct SignUpData: Codable {
    let name: String
    let email: String
    let password: String
    let checkpwd: String
}
