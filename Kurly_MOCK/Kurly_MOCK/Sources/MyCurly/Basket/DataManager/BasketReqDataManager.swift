//
//  BasketReqDataManager.swift
//  Kurly_MOCK
//
//  Created by Yi Joon Choi on 2021/03/23.
//

import Foundation
import Alamofire

class BasketReqDataManager{
    
    let parametersAd : Parameters = [
        "userID" : Constant.USER_ID,
        "nickname" : Constant.NICKNAME
    ]
    
    func reqAd(_ viewController: BasketViewController){
        AF.request("\(Constant.BASE_URL)/app/address", method: .get, parameters: parametersAd, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: BasketResponse.self){ response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        viewController.realAd = response.result!
                        viewController.home.text = viewController.realAd[0].address
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

