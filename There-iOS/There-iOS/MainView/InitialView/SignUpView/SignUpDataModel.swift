//
//  SignUpDataModel.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation

struct SignUpResponse: Codable {
    let code: Int
    let isSuccess: Bool?
    let message: String
    let result: SignUpResult?
    // 회원가입 성공 시 data가 넘어오고, 실패 시 data가 안넘어옴
}

struct SignUpData: Codable {  
    let name: String
    let email: String
    let password: String
    let checkpwd: String
}

struct SignUpResult: Codable {
    let jwt: String
    let userIdx: Int
}
