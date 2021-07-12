//
//  LogInReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/17.
//

import Foundation
import Alamofire

class LogInReqDataManager{
    func reqLogin(_ parameters: LogInReqInput, viewController: LoginViewController){
        AF.request("\(Constant.BASE_URL)/app/login", method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: LogInReqResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        JwtToken.token = response.result!.jwt
                        Constant.NICKNAME = response.result!.nickname
                        Constant.USER_ID = response.result!.userID
                        viewController.dismiss(animated: true, completion: nil)
                        viewController.changeRootViewController(BaseTabBarController())
                        UserDefaults.standard.set(parameters.userName, forKey: "id")
                        UserDefaults.standard.set(parameters.password, forKey: "pw")
                        Constant.HEADERS = ["x-access-token" : JwtToken.token]
                    } else {
                       // viewController.failedToRequest(message: response.message)
                        viewController.presentAlert(title: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.presentAlert(title: "서버와의 연결이 원활하지 않습니다")
                    //viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
        
    }
}
