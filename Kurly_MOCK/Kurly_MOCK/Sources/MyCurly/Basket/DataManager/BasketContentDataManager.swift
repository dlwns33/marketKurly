//
//  BasketContentDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/25.
//

import Foundation
import Alamofire

class BasketContentDataManager{
    func reqContent(_ viewController: BasketViewController){
        AF.request("\(Constant.BASE_URL)/app/basket", method: .get, parameters: nil, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: BasketContentResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
//                        viewController.realAd = response.result!
//                        viewController.home.text = viewController.realAd[0].address
                        viewController.contents = response.result!
                        viewController.didSuccess()
//                        print(response.result!)
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
