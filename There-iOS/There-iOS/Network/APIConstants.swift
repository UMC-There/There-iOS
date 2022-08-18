//
//  APIConstants.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://3.39.57.176:8080"
    
    // MARK: - Feature URL
    // loginURL = "http://3.39.57.176:8080/users/login"
    static let loginURL = baseURL + "/users/login"
    
    // signUpURL = "http://3.39.57.176:8080/users/join"
    static let signUpURL = baseURL + "/users/join"
    
    // kakaoLoginURL
    static let kakaoLoginURL = loginURL + "/kakao"
    
}
