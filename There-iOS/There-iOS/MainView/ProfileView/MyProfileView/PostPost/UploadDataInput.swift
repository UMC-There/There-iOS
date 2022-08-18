//
//  UploadDataInput.swift
//  There-iOS
//
//  Created by 이민아 on 2022/08/11.
//


import Foundation

struct UploadDataInput: Codable { //파라미터
    var images : [String?]
    var jsonList : String?
    var userIdx : Int32?
}
