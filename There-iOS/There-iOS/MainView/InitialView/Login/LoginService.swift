//
//  LoginService.swift
//  There-iOS
//
//  Created by 양채연 on 2022/08/03.
//

import Foundation
import Alamofire

struct LoginService {
    
    // 실질적으로 네트워크를 처리하는 부분
    
    
    // static을 활용해서 shared라는 이름으로 LoginService 싱글턴 인스턴스 선언
    static let shared = LoginService()
    
    // login 메서드: @escape 키워드를 사용해 escape closure형태로 completion 정의
    // 해당 네트워크 작업이 끝날 때 -> completion closure에 네트워크의 결과를 담아서 호출
    
    func login(completion: @escaping(NetworkResult<Any>)->void) {
        // json 형태로 받아오기 위해 header 작성 -> 필요한 헤더를 key-value의 형태로 작성
        let header: HTTTPHeaders = ["Content-Type": "application/json"]
        // dataRequest: 주소를 가지고, get 방식으로, 인코딩 방식으로, 헤더 정보와 함께 요청을 보내기위한 정보 (요청서)
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // dataRequest 요청서를 가지고 서버에 보내서 통신 request를 함 -> 결과는 데이터 Response로 도착
        dataRequest.responseData{dataResponse in
            // dataResponse 안에서 통신에 대한 결과물이 들어있음
            dump(dataResponse)
            
            // dataResponse.result: 통신 성공했는지 실패했는지에 대한 여부
                                 switch dataResponse.result {
        case .success:
            guard let statusCode = dataResponse.response?.statusCode else{return}
            guard let value = dataResponse.value else{return}
            let netWorkResult = self.judgeStatus(by: statusCode, value)
            completion(networkResult)
        
        case .failure: completion(.pathErr)
        }
        }
    }
    // 서버에서 주는 값 중에서 message만 빼서 밖으로 전달
    private func judgeStatus(by statusCode: Int, _data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode(LoginDataModel.self, from: data) else {return .pathErr}
        
        switch ststusCode {
        case 200: return .success(decodeData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
