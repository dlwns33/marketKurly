//
//  OrderListDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/26.
//

import Foundation
import Alamofire

class OrderListDataManager{
    func myOrder(_ viewController: OrderListViewController){
        AF.request("\(Constant.BASE_URL)/app/my/order", method: .get, parameters: nil, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: OrderListResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        viewController.orders = response.result!
                        viewController.didSuccess()
//                        UserDefaults.standard.set(JwtToken.token, forKey: "x-access-token")
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
