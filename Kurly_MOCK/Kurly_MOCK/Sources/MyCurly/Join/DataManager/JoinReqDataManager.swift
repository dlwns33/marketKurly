//
//  JoinReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

import Alamofire

class JoinReqDataManager{
    func reqJoin(_ parameters: JoinReqInput, viewController: JoinViewController){
        AF.request("\(Constant.BASE_URL)/app/users", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: JoinReqResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        viewController.didSuccessJoin()
                    } else {
                        print(response.message)
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
        
    }
}
