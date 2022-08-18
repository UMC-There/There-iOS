//
//  SignUpService.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/08.
//

import Foundation
import Alamofire

struct SignUpService {
    
    // 실질적으로 네트워크를 처리하는 부분
    
    
    // static을 활용해서 shared라는 LoginService 싱글턴 인스턴스 선언
    static let shared = SignUpService()
    
    private init() {}
    
    // signUp 메서드: @escape 키워드를 사용해 escape closure형태로 completion 정의
    // 해당 네트워크 작업이 끝날 때 -> completion closure에 네트워크의 결과를 담아서 호출
    
    func signUp(name: String, email: String, password: String, checkpwd: String, completion: @escaping(NetworkResult<Any>)->Void) {
        // json 형태로 받아오기 위해 header 작성 -> 필요한 헤더를 key-value의 형태로 작성
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        
        // 요청 바디
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password,
            "checkpwd": checkpwd
        ]
        
        
        // dataRequest: 주소를 가지고, get 방식으로, 인코딩 방식으로, 헤더 정보와 함께 요청을 보내기위한 정보 (요청서)
        let dataRequest = AF.request(APIConstants.signUpURL,
                                     method: .post, parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // dataRequest 요청서를 가지고 서버에 보내서 통신 request를 함 -> 결과는 데이터 Response로 도착
        dataRequest.responseData{
            dataResponse in

            // dataResponse.result: 통신 성공했는지 실패했는지에 대한 여부
            switch dataResponse.result {
                
            case .success:
            guard let statusCode = dataResponse.response?.statusCode else{return}
            guard let value = dataResponse.value else{return}
//                guard let token= value.result.jwt else{return}
                
            let networkResult = self.judgeStatus(by: statusCode, value)
            completion(networkResult)
        
            case .failure: completion(.networkFail)
        }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300: return isVaildData(data: data)
        case 400..<500: return .pathErr
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    
    // 통신이 성공하고 원하는 데이터가 올바르게 들어왔을 때 처리하는 함수
    
    private func isVaildData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        // 데이터가 변환이 되게끔 Response 모델 구조체로 데이터를 변환해서 넣고, 그 데이터를 NetworkResult Success
        // 파라미터로 전달
        guard let decodedData = try? decoder.decode(LoginResponse.self, from: data) else {return .pathErr}
        
        return .success(decodedData as Any)
    }
}
